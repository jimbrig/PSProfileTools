function Resolve-KnownFolder {
    <#
    .SYNOPSIS
        Resolve GUID known folder values to full paths.

    .DESCRIPTION
        Resolve GUID known folder values to full paths.
    #>

    [CmdletBinding()]
    param (
        # A path containing a GUID to resolve.
        [Parameter(ValueFromPipeline)]
        [string]$Path
    )

    begin {
        if (-not ('KnownFolder' -as [Type])) {
            Add-Type -TypeDefinition '
            using System;
            using System.Runtime.InteropServices;

            internal class UnsafeNativeMethods
            {
                [DllImport("shell32.dll")]
                internal static extern int SHGetKnownFolderPath(
                    [MarshalAs(UnmanagedType.LPStruct)] Guid rfid,
                    uint dwFlags,
                    IntPtr hToken,
                    out IntPtr ppszPath
                );
            }

            public class KnownFolder {
                public static string GetPath(Guid guid)
                {
                    IntPtr ppszPath = IntPtr.Zero;
                    UnsafeNativeMethods.SHGetKnownFolderPath(
                        guid,
                        0,
                        IntPtr.Zero,
                        out ppszPath
                    );
                    string path = Marshal.PtrToStringUni(ppszPath);
                    Marshal.FreeCoTaskMem(ppszPath);

                    return path;
                }
            }
            '
        }
    }

    process {
        $pathElements = $Path -split '[\\/]'
        if ($guid = $pathElements[0] -as [Guid]) {
            $pathElements[0] = [KnownFolder]::GetPath($guid)
            $Path = [System.IO.Path]::Combine($pathElements)
        }
        $Path
    }
}

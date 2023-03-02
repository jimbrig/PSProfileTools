if (-not ('KnownFolder' -as [Type])) {
    Add-Type -TypeDefinition @"
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
"@
}

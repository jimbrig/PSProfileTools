if (-not ('Visibility' -as [Enum])) {
    Add-Type -TypeDefinition @"
        public enum Visibility : byte {
            Default = 0,
            Hide    = 1,
            Show    = 2
        }
"@
}

using System.Runtime.InteropServices;

namespace AetherExample
{
    public static class NativeMethods
    {
        [DllImport("aether_lib", CallingConvention = CallingConvention.Cdecl, EntryPoint = "add")]
        public static extern int Add(int x, int y);
    }
}

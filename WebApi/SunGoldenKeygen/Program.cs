using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace SunGolden.Keygen
{
    class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
loop:    try
            {
                Console.WriteLine("***************************");
                Console.WriteLine("   SunGolden.Keygen V1.0   ");
                Console.WriteLine();
                Console.WriteLine("输入a开始加密，输入b开始解密：");
                string prod = Console.ReadLine().Trim();
                if (prod.ToUpper().StartsWith("A"))
                {
decode:             Console.WriteLine("请输入明文：");
                    string deCode = Console.ReadLine().Trim();
                    if (string.IsNullOrEmpty(deCode))
                    {
                        Console.WriteLine("明文不能为空！");
                        goto decode;
                    }
                    Console.WriteLine("请输入密钥（使用默认密钥请按回车）：");
                    string key = Console.ReadLine().Trim();
                    if (string.IsNullOrEmpty(key))
                    {
                        Console.WriteLine("密文：");
                        string enCode = Encryption.DEncrypt.Encrypt(deCode);
                        Console.WriteLine(enCode);
                        Clipboard.SetText(enCode);
                        Console.WriteLine("已复制到剪贴板！");
                        Console.WriteLine();
                    }
                    else
                    {
                        Console.WriteLine("密文：");
                        string enCode = Encryption.DEncrypt.Encrypt(deCode, key);
                        Console.WriteLine(enCode);
                        Clipboard.SetText(enCode);
                        Console.WriteLine("已复制到剪贴板！");
                        Console.WriteLine();
                    }
                    goto loop;
                }
                else if (prod.ToUpper().StartsWith("B"))
                {
enCode:             Console.WriteLine("请输入密文：");
                    string enCode = Console.ReadLine().Trim();
                    if (string.IsNullOrEmpty(enCode))
                    {
                        Console.WriteLine("密文不能为空！");
                        goto enCode;
                    }
                    Console.WriteLine("请输入密钥（使用默认密钥请按回车）：");
                    string key = Console.ReadLine().Trim();
                    if (string.IsNullOrEmpty(key))
                    {
                        Console.WriteLine("明文：");
                        string deCode = Encryption.DEncrypt.Decrypt(enCode);
                        Console.WriteLine(deCode);
                        Clipboard.SetText(deCode);
                        Console.WriteLine("已复制到剪贴板！");
                        Console.WriteLine();
                    }
                    else
                    {
                        Console.WriteLine("明文：");
                        string deCode = Encryption.DEncrypt.Decrypt(enCode, key);
                        Console.WriteLine(deCode);
                        Clipboard.SetText(deCode);
                        Console.WriteLine("已复制到剪贴板！");
                        Console.WriteLine();
                    }
                    goto loop;
                }
                else
                {
                    Console.WriteLine("不支持的处理过程！");
                    Console.WriteLine();
                    goto loop;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("程序异常："+ex.Message);
                Console.WriteLine();
                goto loop;
            }
        }
    }
}

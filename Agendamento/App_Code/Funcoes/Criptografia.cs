using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Agendamento.App_Code.Funcoes;

namespace Agendamento.App_Code.Funcoes
{
    public class Criptografia
    {
        public static string Chave = "YG5M5GHUJH4HJRLS";
        public static string VetorInicializacao = "YG5M5GHUJH4HJRLS";

        public static string Cifra(string valor, string sessao)
        {
            valor = Cripto.Encriptar(Chave, VetorInicializacao, valor);
            return valor;
        }

        public static string Decifra(string valor, string sessao)
        {
            valor = Cripto.Decriptar(Chave, VetorInicializacao, valor);
            return valor;
        }

        public static string Cifra(string valor)
        {
            valor = Cripto.Encriptar(Chave, VetorInicializacao, valor);
            return valor;
        }

        public static string Decifra(string valor)
        {
            valor = Cripto.Decriptar(Chave, VetorInicializacao, valor);
            return valor;
        }
    }
}
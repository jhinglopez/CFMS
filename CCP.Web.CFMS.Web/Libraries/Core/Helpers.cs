namespace CCP.Web.CFMS.Web.Libraries.Core
{
    public class Helpers
    {
        public static string NormalizeUrl(string value)
        {
            string newValue = value;
            newValue = newValue.Replace(" ", "_");
            newValue = newValue.Replace("~", "");
            newValue = newValue.Replace("!", "");
            newValue = newValue.Replace("@", "");
            newValue = newValue.Replace("#", "");
            newValue = newValue.Replace("$", "");
            newValue = newValue.Replace("%", "");
            newValue = newValue.Replace("^", "");
            newValue = newValue.Replace("&", "");
            newValue = newValue.Replace("*", "");
            newValue = newValue.Replace("(", "");
            newValue = newValue.Replace(")", "");
            newValue = newValue.Replace("+", "");
            newValue = newValue.Replace("=", "");
            newValue = newValue.Replace("[", "");
            newValue = newValue.Replace("]", "");
            newValue = newValue.Replace("{", "");
            newValue = newValue.Replace("}", "");
            newValue = newValue.Replace("|", "");
            newValue = newValue.Replace("\\", "");
            newValue = newValue.Replace(";", "");
            newValue = newValue.Replace(":", "");
            newValue = newValue.Replace("'", "");
            newValue = newValue.Replace("\"", "");
            newValue = newValue.Replace("<", "");
            newValue = newValue.Replace(">", "");
            newValue = newValue.Replace(",", "");
            newValue = newValue.Replace(".", "");
            newValue = newValue.Replace("?", "");
            newValue = newValue.Replace("/", "");
            newValue = newValue.Replace("–", "");
            newValue = newValue.Replace("-", "");
            newValue = newValue.Replace("‘", "");
            newValue = newValue.Replace("’", "");
            return newValue;
        }
    }
}
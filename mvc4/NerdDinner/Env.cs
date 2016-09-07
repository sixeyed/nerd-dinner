using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NerdDinner
{
    public class Env
    {
        private static Dictionary<string, string> _Values = new Dictionary<string, string>();

        public static string BingMapsKey { get { return Get("BING_MAPS_KEY"); } }

        public static string IpInfoDbKey { get { return Get("IP_INFO_DB_KEY"); } }

        public static string AuthDbConnectionString { get { return Get("AUTH_DB_CONNECTION_STRING"); } }

        public static string AppDbConnectionString { get { return Get("APP_DB_CONNECTION_STRING"); } }

        private static string Get(string variable)
        {
            if (!_Values.ContainsKey(variable))
            {
                var value = Environment.GetEnvironmentVariable(variable);
                _Values[variable] = value;
            }
            return _Values[variable];
        }
    }
}
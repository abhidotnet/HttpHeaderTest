using HttpHeaderTest.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HttpHeaderTest.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [System.Web.Http.HttpPost]
        public IHttpActionResult Post ([FromBody] StudentModel studentModel)
        {
            Debug.WriteLine("Print headers on request");
            //System.Collections.Specialized.NameValueCollection coll;
            foreach (var header in Request.Headers)
            {
                string headerName = header.Key;
                string headerContent = string.Join(",", Request.Headers.GetValues(header.Key));
                Debug.WriteLine($"{headerName} ==> {headerContent}");
            }
            return Ok();
        }

        // PUT api/values/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}

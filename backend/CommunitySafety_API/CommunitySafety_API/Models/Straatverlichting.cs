using System.Runtime.Versioning;

namespace CommunitySafety_API.Models
{
    public class Straatverlichting
    {
        public required int Id { get; set; }

        public required string District { get; set; }

        public required string StreetName { get; set; }
    }
}

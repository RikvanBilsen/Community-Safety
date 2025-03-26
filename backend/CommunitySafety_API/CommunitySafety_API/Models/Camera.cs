namespace CommunitySafety_API.Models
{
    public class Camera
    {
        public required int Id { get; set; }

        public string? Name { get; set; }

        public string? Locatie { get; set; }

        public string? Description { get; set; }

        public required string Coordinates { get; set; }
    }
}

provider "local" {
  region = "ap-northeast-2"
}

variable "hero_thousand_faces" {
  description = "map"
  type        = map(string)
  default = {
    neo      = "hero"
    trinity  = "love interest"
    morpheus = "mentor"
  }
}


output "bios" {
  value = [for name,role in var.hero_thousand_faces : "${name} is the ${role}"]
}

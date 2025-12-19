output "upper_user_names" {
  value = [for name in var.user_names: upper(name) if length(name) < 4]
}

output "bios" {
  value = [for name, role in var.hero_thousand_faces: "${name} is the ${role}"]
}
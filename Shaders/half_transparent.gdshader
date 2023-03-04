shader_type canvas_item;

void fragment() {
	// Get the color from the texture
	vec4 col = texture(TEXTURE,UV);

	// Change alpha to make the image more transparent
	COLOR = vec4(col.r, col.g, col.b, col.a - 0.6);

}


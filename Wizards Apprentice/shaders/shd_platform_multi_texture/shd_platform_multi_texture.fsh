varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D shape_texture;

void main()
{
	// Main texture to use
	vec4 base_tex_color = texture2D(gm_BaseTexture, v_vTexcoord);
	
	// Shape to use
	vec4 shape_tex_color = texture2D(shape_texture, v_vTexcoord);
	
	// Combine shape and color
	vec4 final_tex_color = vec4(base_tex_color.rgb, shape_tex_color.a);
	
	// Set shader for display
    gl_FragColor = v_vColour * final_tex_color;
}

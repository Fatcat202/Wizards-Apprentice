//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float range;
uniform vec4 colour_match;
uniform vec4 colour_replace;

void main()
{
	
	// Used to replace a single colour of a sprite passed through
	
	
	// Gather pixel colours of sprite
    vec4 pixel_colour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
  
	// Set range of colours to search
	float new_range = range / 255.0; // Range 0-1
  
	// Replace colours if wihtin range to replace
	if(abs(pixel_colour.r - colour_match.r) <= new_range)
	{
		if(abs(pixel_colour.g - colour_match.g) <= new_range)
		{
			if(abs(pixel_colour.b - colour_match.b) <= new_range)
			{
				pixel_colour.rgb = colour_replace.rgb;
			}
		}
	}
  
	// Return updated sprite
    gl_FragColor = pixel_colour;
}

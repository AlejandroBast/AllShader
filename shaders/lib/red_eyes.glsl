#ifndef RED_EYES_GLSL
#define RED_EYES_GLSL

// Ojos rojos que brillan, solo en mobs agresivos: se pinta el pixel central de cada ojo.
// Las coordenadas estan en pixeles de la textura vanilla. Si usas un pack HD
// se escalan solas porque se trabaja con la UV (0..1) de la textura.
//
// Ademas se revisa que la textura tenga la misma proporcion que la vanilla,
// asi no se pintan puntos rojos en capas extra como la armadura (64x32).

bool isRedEyePixel(int id, vec2 uv, ivec2 texSize) {
	if(!IS_EYES_MOB(id)) return false;

	vec2 base = vec2(64.0, 64.0);
	ivec2 eyeL = ivec2(10, 12);
	ivec2 eyeR = ivec2(13, 12);

	if(id == ENTITY_EYES_ZOMBIE)        { base = vec2(64.0, 64.0);  eyeL = ivec2(10, 12); eyeR = ivec2(13, 12); }
	else if(id == ENTITY_EYES_SKELETON) { base = vec2(64.0, 32.0);  eyeL = ivec2(10, 12); eyeR = ivec2(13, 12); }
	else if(id == ENTITY_EYES_CREEPER)  { base = vec2(64.0, 32.0);  eyeL = ivec2(10, 11); eyeR = ivec2(13, 11); }
	else if(id == ENTITY_EYES_ILLAGER) { base = vec2(64.0, 64.0);  eyeL = ivec2(10, 14); eyeR = ivec2(13, 14); }
	else if(id == ENTITY_EYES_WITCH)    { base = vec2(64.0, 128.0); eyeL = ivec2(10, 14); eyeR = ivec2(13, 14); }
	else if(id == ENTITY_EYES_PIGLIN)   { base = vec2(64.0, 64.0);  eyeL = ivec2(10, 11); eyeR = ivec2(15, 11); }

	// misma proporcion que la textura vanilla o nada
	float aspect = float(texSize.x) / float(max(texSize.y, 1));
	if(abs(aspect - base.x / base.y) > 0.01) return false;

	ivec2 px = ivec2(floor(clamp(uv, 0.0, 0.9999) * base));
	return px == eyeL || px == eyeR;
}

#endif

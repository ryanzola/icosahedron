uniform float time;
uniform float progress;
uniform sampler2D landscape;
uniform vec4 resolution;
varying vec2 vUv;
varying vec3 vNormal;
varying vec3 eyeVector;
varying vec3 vBary;
float PI=3.141592653589793238;

void main(){
	float width=2.;
	vec3 d=fwidth(vBary);
	vec3 s=smoothstep(d*(width+.5),d*(width-.5),vBary);
	float l=max(s.x,max(s.y,s.z));
	
	if(l<.1)discard;
	gl_FragColor=vec4(mix(vec3(1.),vec3(0.),1.-l),1.);
}
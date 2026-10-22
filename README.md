<p align="center"><img src="pack.png" width="160" alt="AllShader"></p>

<h1 align="center">AllShader</h1>

<p align="center">
Mi versión del shader <b>Eclipse</b> para Minecraft, con arreglos para <b>Lunar Client</b>,<br>
sombras más marcadas y ojos rojos que brillan en los mobs agresivos.
</p>

---

## Qué tiene de nuevo

| Cambio | Detalle |
|---|---|
| **Bloques visibles en Lunar** | El terreno sólido usaba teselación y geometry shader (solo para el pasto 3D). Lunar no los dibuja y el suelo se veía transparente. Se quitaron y el pasto 3D queda apagado. |
| **Sombras más marcadas** | Bordes menos borrosos, menos luz ambiente en zonas de sombra, más oclusión ambiental y mapa de sombras de 3072. |
| **Ojos rojos** | Solo el píxel central de cada ojo de los mobs agresivos se pone rojo y brilla. |
| **Noches más visibles** | Más luz de luna y más luz mínima afuera. Las cuevas siguen oscuras. |
| **Perfil Lunar** | Igual a High, sin pasto 3D y con sombras hasta 192 bloques. |
| **Agua** | Sin cambios. Se mantiene igual que en Eclipse. |

### Mobs con ojos rojos

Zombie, husk, drowned, aldeano zombie, esqueleto, stray, wither skeleton, creeper, pillager, vindicator, evoker, illusioner, bruja, piglin y piglin brute.

Los mobs pacíficos y neutrales (aldeanos, animales, lobo, piglin zombificado) no los tienen. La araña y el enderman ya traen ojos brillantes de vanilla.

## Instalación

1. Descarga el repo como `.zip` (botón **Code → Download ZIP**) o clónalo.
2. Deja `pack.png` y la carpeta `shaders` en la raíz de un `.zip`:
   ```
   AllShader.zip
   ├── pack.png
   └── shaders/
   ```
3. Copia el `.zip` en la carpeta `shaderpacks` de Lunar Client (o de Iris).
4. En el juego: **Opciones → Shaders**, elige **AllShader** y en *Profile* selecciona **Lunar**.

## Requisitos

- Lunar Client o Iris con soporte de compute shaders y SSBO (OpenGL 4.3).
- No funciona con OptiFine.

## Ajustes útiles

| Dónde | Opción | Para qué |
|---|---|---|
| Emissives | `MOB_RED_EYES` | Activar o apagar los ojos rojos |
| Emissives | `MOB_RED_EYES_GLOW` | Qué tanto brillan |
| Emissives | `MOB_RED_EYES_R/G/B` | Cambiar el color de los ojos |
| Ambient Colors | `ambient_brightness` | Sube a 0.8 si las sombras quedan muy oscuras |
| Debug Stuff | `DEBUG_VIEW = debug_SHADOWMAP` | Ver si el mapa de sombras se está generando |

## Archivos principales que se cambiaron

```
shaders/
├── lib/red_eyes.glsl        # detección del píxel del ojo
├── lib/entities.glsl        # ids de los mobs con ojos
├── lib/settings.glsl        # sombras, noches, opciones nuevas
├── dimensions/all_solid.fsh # pinta y hace brillar los ojos
├── entity.properties        # grupos de mobs agresivos
└── shaders.properties       # perfil Lunar y menú
```

## Créditos

- **Eclipse Shader** de [Merlin1809](https://github.com/Merlin1809/Eclipse-Shader), basado en **Bliss** (X0nk) y **Chocapic13**. Todo el trabajo base es de ellos.
- Las ideas de iluminación están inspiradas en **Complementary Reimagined**, sin copiar su código.

Si vas a publicar este shader, revisa primero las licencias de Eclipse y Bliss.

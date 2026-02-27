from PIL import Image, ImageDraw
import os

# Directorio de destino
output_dir = 'assets/images'
os.makedirs(output_dir, exist_ok=True)

# Crear 6 avatares simples con colores diferentes
colors = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#FFA07A', '#98D8C8', '#F7DC6F']
names = ['J', 'P', 'C', 'M', 'A', 'L']

for i, (color, name) in enumerate(zip(colors, names), 1):
    img = Image.new('RGB', (100, 100), color=color)
    draw = ImageDraw.Draw(img)
    # Agregar inicial del nombre
    draw.text((40, 35), name, fill='white')
    filename = os.path.join(output_dir, f'avatar{i}.jpg')
    img.save(filename)
    print(f'Created {filename}')

print('All avatars created successfully!')


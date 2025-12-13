#!/bin/bash

FILE=$1 # Pasamos el archivo que se quiere cortar
FRACTION=18 # alumno18 → cortar 1/18 del archivo

# Calcular líneas totales
TOTAL_LINES=$(wc -l < "$FILE")

# Calcular cuántas líneas cortar (1/18 del archivo)
CUT_LINES=$(( TOTAL_LINES / FRACTION ))

echo "Procesando: $FILE"
echo "Cortando 1/$FRACTION del fichero → $CUT_LINES líneas"

# Archivo temporal
OUTPUT="${FILE}.cut"

# Cortar la parte superior
head -n "$CUT_LINES" "$FILE" > "$OUTPUT"

# Reemplazar el original
mv "$OUTPUT" "$FILE"

echo "Corte completado."

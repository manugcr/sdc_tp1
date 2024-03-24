# Sistemas de Computacion
Trabajo Practico N1 de Sistemas de Computacion

---

En este trabajo se llevara a cabo un profiling con `gprof` en un codigo en C `test_gprof.c` sobre en el cual se analizaran los resultados. Tambien se realizara el mismo analisis pero con `perf`.

Para ejecutarlo se puede utilizar el script en bash
```bash
$ sh ./RUNPROFILING
```

---

Para analizar la diferencia en tiempo de ejecucion cuando se cambia la frecuencia del clock, se puede utilizar una ESP8266/ESP32 con el codigo proporcionado `sdc_freqtest`

```bash
Time taken at 160MHz: 6925 microseconds
Time taken at 80MHz: 13855 microseconds
```

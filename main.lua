--mainlua--


display.setDefault("background",0, 0, 128) --color de fondo


--circulo
local circuloEstado = display.newCircle(display.contentCenterX, 480, 80) -- Radio de circulo de 80
circuloEstado:setFillColor(1, 1, 1, 0.2)
circuloEstado.strokeWidth = 5
circuloEstado:setStrokeColor(1)

local textoEnCirculo = display.newText({
    text = "",
    x = circuloEstado.x,
    y = circuloEstado.y,
    font = native.systemFontBold,
    fontSize = 35
})

local titulo = display.newText({
    text = "Calculadora de IMC",
    x = display.contentCenterX,
    y = 60,
    font = native.systemFontBold,
    fontSize = 28
})

local peso = native.newTextField(display.contentCenterX, 130, 220, 40)
peso.placeholder = "Peso (kg)"
peso.inputType = "decimal"

local altura = native.newTextField(display.contentCenterX, 190, 220, 40)
altura.placeholder = "Altura (m)"
altura.inputType = "decimal"

local resultado = display.newText({
    text = "IMC: --",
    x = display.contentCenterX,
    y = 260,
    font = native.systemFont,
    fontSize = 18
})

-- Calculo de IMC
local function CalcularIMC()
    native.setKeyboardFocus(nil)
    
    local p = tonumber(peso.text)
    local h = tonumber(altura.text)

    -- Validaciones
    if not p or not h or h < 0.5 or h > 2.5 or p < 10 or p > 300 then
        resultado.text = "Datos inválidos o campos vacíos"
        return
    end

    local imc = p / (h * h)
    imc = math.floor(imc * 10) / 10 

    local categoria = ""
    local mensaje = ""
    
    -- Lógica de colores
     if imc < 18.5 then
        categoria = "Bajo peso"
        mensaje = "¡Consulta con un nutricionista!"
        circuloEstado:setFillColor(0.6, 0.8, 1) -- Círculo Azul
        resultado:setFillColor(0.6, 0.8, 1)     -- Texto Azul
    elseif imc < 25 then
        categoria = "Normal"
        mensaje = "¡Excelente estado físico!"
        circuloEstado:setFillColor(0, 1, 0)     -- Círculo Verde
        resultado:setFillColor(0, 1, 0)         -- Texto Verde
    elseif imc < 30 then
        categoria = "Sobrepeso"
        mensaje = "¡Es hora de hacer ejercicio!"
        circuloEstado:setFillColor(1, 0.6, 0)   -- Círculo Naranja
        resultado:setFillColor(1, 0.6, 0)       -- Texto Naranja
    else 
        categoria = "Obesidad"
        mensaje = "Cuidado, prioriza tu salud."
        circuloEstado:setFillColor(1, 0, 0)     -- Círculo Rojo
        resultado:setFillColor(1, 0, 0)         -- Texto Rojo
    end

    resultado.text = categoria .. "\n" .. mensaje
    textoEnCirculo.text = imc
    
    -- Animación de "latido" al calcular
    transition.from(circuloEstado, { time=400, xScale=1.2, yScale=1.2, transition=easing.outBack })
end

local function limpiar()
    native.setKeyboardFocus(nil)
    peso.text = ""
    altura.text = ""
    resultado.text = "IMC: --"
    textoEnCirculo.text = ""
    circuloEstado:setFillColor(1, 1, 1, 0.2)
end

local btnCalcular = display.newText({
    text = "CALCULAR",
    x = display.contentCenterX,
    y = 330,
    font = native.systemFontBold,
    fontSize = 24
})
btnCalcular:setFillColor(0, 1, 0)
btnCalcular:addEventListener("tap", CalcularIMC)

local bntLimpiar = display.newText({
    text = "Limpiar",
    x = display.contentCenterX,
    y = 600, --aqui lo agregamos abajo para mejorar lo visual
    fontSize = 22
})
bntLimpiar:setFillColor(1, 1, 0)
bntLimpiar:addEventListener("tap", limpiar)

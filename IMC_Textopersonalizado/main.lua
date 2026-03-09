

display.setDefault("background", 0, 0.5, 1) --Azul claro


local titulo = display.newText({
    text = "Calculadora de IMC",
    x = display.contentCenterX,
    y = 40,
    font = native.systemFontBold,
    fontsize = 28

})
titulo:setFillColor(1)

--CAMPOS DE ENTRADA


local peso = native.newTextField(display.contentCenterX, 100, 220, 40)
peso.placeholder = "peso (kg)"
peso.inputType = "decimal"

local altura = native.newTextField(display.contentCenterX, 160, 220, 40)
altura.placeholder = "Altura (m)"
altura.inputType = "decimal"



-- TEXTO RESULTADO



local resultado = display.newText({
    text = "IMC: --",
    x = display.contentCenterX,
    y = 230,
    font = native.systemFont,
    fontSize = 22
})
resultado:setFillColor(1)



-- FUNCION PARA CALCULAR EL IMC


-- ... (mantén tu fondo y campos de entrada igual)

local function CalcularIMC()
    native.setKeyboardFocus(nil)
    local p = tonumber(peso.text)
    local h = tonumber(altura.text)

    -- VALIDACIONES COMPLETAS (Requisito técnico)
    if peso.text == "" or altura.text == "" then
        resultado.text = "Error: Campos vacíos"
        return
    end

    if not p or not h then
        resultado.text = "Error: Use solo números"
        return
    end

    -- Validación de valores negativos e irreales
    if h < 0.5 or h > 2.5 then
        resultado.text = "Altura irreal (0.5m - 2.5m)"
        return
    elseif p < 10 or p > 300 then
        resultado.text = "Peso irreal (10kg - 300kg)"
        return
    end

    -- CÁLCULO Y REDONDEO
    local imc = p / (h * h)
    imc = math.floor(imc * 10) / 10 

    -- CLASIFICACIÓN ESTRUCTURADA
    -- CLASIFICACIÓN CON COLOR DINÁMICO
    local categoria = ""
    local mensaje = ""
    
    if imc < 18.5 then
        categoria = "Bajo peso"
        mensaje = "¡Consulta con un nutricionista!"
        resultado:setFillColor(0.6, 0.8, 1) -- Azul
    elseif imc < 25 then
        categoria = "Normal"
        mensaje = "¡Excelente estado físico!"
        resultado:setFillColor(0, 1, 0)     -- Verde
    elseif imc < 30 then
        categoria = "Sobrepeso"
        mensaje = "¡Es hora de hacer ejercicio!"
        resultado:setFillColor(1, 0.6, 0)   -- Naranja
    else 
        categoria = "Obesidad"
        mensaje = "Cuidado, prioriza tu salud."
        resultado:setFillColor(1, 0, 0)     -- Rojo
    end

    -- Actualizamos el texto con 3 niveles de información
    resultado.text = "IMC: " .. imc .. "\n" .. categoria .. "\n" .. mensaje

end


-- FUNCION PARA LIMPIAR CAMPOS

local function limpiar()
    peso.text = ""
    altura.text = ""
    resultado.text = "IMC: --"
    
end


-- BOTON PARA CALCULAR
local btnCalcular = display.newText({
    text = "Calcular IMC",
    x = display.contentCenterX,
    y = 290,
    font = native.systemFontBold,
    fontSize = 24

})
btnCalcular:setFillColor(0, 1, 0)
btnCalcular:addEventListener("tap", CalcularIMC)


-- BOTON LIMPIAR

local bntLimpiar = display.newText({
    text = "Limpiar",
    x = display.contentCenterX,
    Y = 340,
    fontSize = 22

})
bntLimpiar:setFillColor(1, 1, 0)
bntLimpiar:addEventListener("tap", limpiar)



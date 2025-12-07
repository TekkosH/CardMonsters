local cards = require("Cards")
local funcs = {}

GameState = {
    selectedCard = nil,
    playerCard = cards,
    turn = 0,
    enemyCard = nil
}

function funcs.utf8Console()
    os.execute("chcp 65001") --Configura o console para UTF-8 no Windows
    os.execute("cls")        --Limpa o console
end

---função para retornar atributos em barra
function funcs.getAttributeBar(attribute)
    local fullChar = "🟩"
    local emptyChar = "⬛"

    local result = ""
    for i = 1, 10, 1 do
        if i <= attribute then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end

--Funções de seleção e exibição de cartas

function funcs.cardSelect() ---funções para escolher a carta(i know this func is huge, i'll refactor it later with OOP)
    print("Escolha uma carta para jogar: \n")

    local cardCount = 0 -- contador para mostrar as opções numeradas

    local nav = {}      -- tabela para navegação entre cartas

    ---passa os nomes e o número da carta para a tabela de navegação
    for names, cardValue in pairs(cards) do
        cardCount = cardCount + 1 -- contador para mostrar as opções numeradas
        print(cardCount .. " - " .. names)

        nav[cardCount] = names  -- adiciona o nome da carta na tabela de navegação
    end
    print("")                   -- espaço para melhor visualização

    local choice = io.read("n") -- lê a escolha do usuário como número


    ---Dá mensagem de erro caso a escolha seja inválida
    while type(choice) ~= "number" or nav[choice] == nil do
        print("Escolha inválida. Digite um número correspondente a uma carta:")
        choice = io.read("*n")
    end

    GameState.selectedCard = nav
    [choice]                                                                  -- obtém nome do card escolhido, choice tem que ser num

    print(string.format("Você escolheu a carta: %s", GameState.selectedCard)) --printa nome da carta escolhida, necessário return para utilizar na func de atributos.
end

---função para mostrar os atributos da carta escolhida
function funcs.ShowEnemyCardAttributes()
    GameState.playerCard = cards[GameState.selectedCard]

    print(
        "=============================================================================================================================")
    print("| " .. "🪪 Nome: " .. GameState.playerCard.name)
    print("| " .. "🏷️ Tipo: " .. GameState.playerCard.type)
    print("| " .. "📖 Descrição: " .. GameState.playerCard.description)
    print("| " .. "⏳ Habilidade Passiva: " .. GameState.playerCard.passiveAbility)
    print("| " .. "💥 Habilidade Ativa: " .. GameState.playerCard.activeAbility)
    print("| ")
    print("| " .. "📃 ATRIBUTOS: ")
    print("| ")
    print("| " .. "❤️ Vitalidade:    " .. funcs.getAttributeBar(GameState.playerCard.attributes.HP))
    print("| " .. "⚔️ Ataque:        " .. funcs.getAttributeBar(GameState.playerCard.attributes.ATK))
    print("| " .. "🛡️ Defesa:        " .. funcs.getAttributeBar(GameState.playerCard.attributes.DEF))
    print("| " .. "🏃 Velocidade:   " .. funcs.getAttributeBar(GameState.playerCard.attributes.SPD))
    print("| " .. "🧠 Inteligência: " .. funcs.getAttributeBar(GameState.playerCard.attributes.INT))
    print(
        "=============================================================================================================================")
end

---função para selecionar carta inimiga aleatória com base em número aleatório
function funcs.enemyCardSelect()
    local randomEnemy = math.random(5)

    if randomEnemy == 1 then
        GameState.enemyCard = cards.Demogorgon
    elseif randomEnemy == 2 then
        GameState.enemyCard = cards.Eleven
    elseif randomEnemy == 3 then
        GameState.enemyCard = cards.DemoDogs
    elseif randomEnemy == 4 then
        GameState.enemyCard = cards.Nortragamus
    else
        GameState.enemyCard = cards.Xtranho
    end
end

---função de combate entre cartas(I made it simple for now, i'll refactor it later, no notes here bcuz i was multitasking while coding it but i know it would've been better with funcs for attacks, skills and stuff.)
function funcs.combat()
    while GameState.playerCard.attributes.HP > 0 and GameState.enemyCard.attributes.HP > 0 do
        local rng = 0
        GameState.turn = GameState.turn + 1

        print("\n--- Turno " .. GameState.turn .. " ---")
        print("O que você deseja fazer?")
        print("1 - Atacar")
        print("2 - Usar Habilidade Ativa")
        print("3 - Fugir")
        local action = io.read("*n")

        while not (action < 1 or action > 3 or action ~= type("number")) do
            print("Ação inválida. Escolha novamente:")
            action = io.read("*n")
        end

        if action == 1 then
            rng = math.random(20)
            if rng >= 10 then
                GameState.enemyCard.attributes.HP = GameState.enemyCard.attributes.HP -
                    GameState.playerCard.attributes.ATK
                print("Você atacou " ..
                    GameState.enemyCard.name .. " causando " .. GameState.playerCard.attributes.ATK .. " de dano!")
            else
                print("Seu ataque falhou!")
            end
        elseif action == 2 then
            rng = math.random(20)

            if rng <= 8 then
                print("A habilidade ativa falhou!")
            else
                GameState.enemyCard.attributes.HP = GameState.enemyCard.attributes.HP -
                    (GameState.playerCard.attributes.ATK + 1)
                print(GameState.playerCard.name ..
                    " usou a habilidade ativa: " ..
                    GameState.playerCard.activeAbility ..
                    " e causou " .. GameState.playerCard.attributes.ATK + 1 .. " de dano ao inimigo.")
            end
        elseif action == 3 then
            rng = math.random(20)

            if rng > 15 then
                print("Você conseguiu fugir do combate!")
                break
            else
                print("Fuga falhou! O combate continua.")
            end
        end

        funcs.showCardAttributes()
        funcs.ShowEnemyCardAttributes()
        -- Turno do inimigo

        if GameState.playerCard.attributes.HP > 0 and GameState.enemyCard.attributes.HP > 0 then
            local enemyRng = math.random(20)
            if enemyRng <= 12 then
                rng = math.random(20)
                if rng >= 10 then
                    GameState.playerCard.attributes.HP = GameState.playerCard.attributes.HP -
                        GameState.enemyCard.attributes.ATK
                    print("O inimigo " .. GameState.enemyCard.name ..
                        " atacou você causando " .. GameState.enemyCard.attributes.ATK .. " de dano!")
                else
                    print("O ataque do inimigo falhou!")
                end
            else
                rng = math.random(20)
                if rng <= 8 then
                    print("A habilidade ativa do inimigo falhou!")
                else
                    GameState.playerCard.attributes.HP = GameState.playerCard.attributes.HP -
                        (GameState.enemyCard.attributes.ATK + 1)
                    print("O inimigo " .. GameState.enemyCard.name ..
                        " usou a habilidade " ..
                        GameState.enemyCard.activeAbility ..
                        " em você causando " .. GameState.enemyCard.attributes.ATK + 1 .. " de dano!")
                end
            end
        end
    end
end

function funcs.showCardAttributes()
    GameState.playerCard = cards[GameState.selectedCard]

    print(
        "=============================================================================================================================")
    print("| " .. "🪪 Nome: " .. GameState.enemyCard.name)
    print("| " .. "🏷️ Tipo: " .. GameState.enemyCard.type)
    print("| " .. "📖 Descrição: " .. GameState.enemyCard.description)
    print("| " .. "⏳ Habilidade Passiva: " .. GameState.enemyCard.passiveAbility)
    print("| " .. "💥 Habilidade Ativa: " .. GameState.enemyCard.activeAbility)
    print("| ")
    print("| " .. "📃 ATRIBUTOS: ")
    print("| ")
    print("| " .. "❤️ Vitalidade:    " .. funcs.getAttributeBar(GameState.enemyCard.attributes.HP))
    print("| " .. "⚔️ Ataque:        " .. funcs.getAttributeBar(GameState.enemyCard.attributes.ATK))
    print("| " .. "🛡️ Defesa:        " .. funcs.getAttributeBar(GameState.enemyCard.attributes.DEF))
    print("| " .. "🏃 Velocidade:   " .. funcs.getAttributeBar(GameState.enemyCard.attributes.SPD))
    print("| " .. "🧠 Inteligência: " .. funcs.getAttributeBar(GameState.enemyCard.attributes.INT))
    print(
        "=============================================================================================================================")
end

return funcs

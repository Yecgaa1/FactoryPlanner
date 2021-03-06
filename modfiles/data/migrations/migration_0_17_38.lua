migration_0_17_38 = {}

function migration_0_17_38.global()
end

function migration_0_17_38.player_table(player, player_table)
end

function migration_0_17_38.subfactory(player, subfactory)
    for _, item in pairs(Subfactory.get_in_order(subfactory, "Ingredient")) do item.top_level=true;item.sprite=nil end
    for _, item in pairs(Subfactory.get_in_order(subfactory, "Product")) do item.top_level=true;item.sprite = nil end
    for _, item in pairs(Subfactory.get_in_order(subfactory, "Byproduct")) do item.top_level=true;item.sprite = nil end

    for _, floor in pairs(Subfactory.get_in_order(subfactory, "Floor")) do
        for _, line in pairs(Floor.get_in_order(floor, "Line")) do
            for _, item in pairs(Line.get_in_order(line, "Ingredient")) do item.sprite = nil end
            for _, item in pairs(Line.get_in_order(line, "Product")) do item.sprite = nil end
            for _, item in pairs(Line.get_in_order(line, "Byproduct")) do item.sprite = nil end
            for _, module in pairs(Line.get_in_order(line, "Module")) do module.sprite = nil end

            line.recipe.sprite = nil
            line.machine.sprite = nil

            local beacon = line.beacon
            if line.beacon ~= nil then
                beacon.sprite = nil
                beacon.module.sprite = nil
            end
        end
    end
end
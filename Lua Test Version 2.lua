menu.action(menu.my_root(), "Nom du bouton", {"commande"}, "Description", function()
    util.toast("Bonjour!")
end)

menu.list(menu.my_root(), "Nom de la liste", {"commande"}, "Description")

list = menu.list(menu.my_root(), "Nom de la liste", {"commande"}, "Description")

menu.action(list, "Nom du Bouton", {"commande"}, "Description", function()
    util.toast("Bonjour!")
end)

menu.toggle_loop(menu.my_root(), "Nom du Toggle Loop", {"commande"}, "Description", function()
    util.toast("La loop est activée!")
end)

menu.toggle(menu.my_root(), "Super Saut", {"scriptsupersaut"}, "Active et Désactive le Super Saut se trouvant dans 'Soi'.", function(on)
    if on then
      menu.trigger_commands("superjump on")
      util.toast("Super Saut activé!")
    else
      menu.trigger_commands("superjump off")
      util.toast("Super Saut désactivé!")
    end
end)

menu.toggle_loop(menu.my_root(), "Nom de Toggle Loop", {"commande"}, "Description", function()
    util.toast("La loop est activée!")
    util.yield(1000)
end)

-- partie 2

username = players.get_name(players.user())

menu.action(menu.my_root(), "Pseudo d'utilisateur", {"getusername"}, "", function()
  util.toast(username)
end)

root = menu.my_root()
action = menu.action
toggle = menu.toggle
toggleloop = menu.toggle_loop

action(root, "Bouton", {"commande"}, "", function()
    util.toast("Bonjour!")
end)

toast = util.toast

action(root, "Pseudo du User", {"gotusername"}, "", function()
    toast(username)
end)

rid = players.get_rockstar_id(players.user())

action(root, "Infos User (Pseudo + RID)", {}, "", function()
  toast($"{username}\n{rid}")
end)

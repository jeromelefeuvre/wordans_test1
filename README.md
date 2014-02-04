Créer une classe User avec 4 attributs (nane, email, created_at, id)
Créer un tableau de 4 users (prend les valeurs que tu souhaite)
Fait une seconde classe 'Exporter' qui a partir de ton tableau précédent, va générer un CSV.
Pour avoir notre CSV il nous suffira alors de faire un
exporter = Exporter.new(columns: %w(id name email created_at))
puts exporter.export(users)
(bien sur si on change l'ordre des colonnes, le csv devra suivre)
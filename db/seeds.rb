# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
agents = Agent.create([
    { agent_name: 'jett' }, { agent_name: 'raze' },
    { agent_name: 'breach' }, { agent_name: 'omen' },
    { agent_name: 'brimstone' }, { agent_name: 'phoenix' },
    { agent_name: 'sage' }, { agent_name: 'sova' },
    { agent_name: 'viper' }, { agent_name: 'cypher' },
    { agent_name: 'reyna' }, { agent_name: 'killjoy' },
    { agent_name: 'skye' }, { agent_name: 'yoru' },
    { agent_name: 'astra' }, { agent_name: 'kayo' },
    { agent_name: 'chamber' }, { agent_name: 'neon' },
    { agent_name: 'fade' }, { agent_name: 'harbor' },
    { agent_name: 'gekko' } 
])

maps = Map.create([
    {map_name: 'split'}, {map_name: 'bind'}, 
    {map_name: 'haven'}, {map_name: 'acsent'}, 
    {map_name: 'icebox'}, {map_name: 'breeze'}, 
    {map_name: 'fracture'}, {map_name: 'pearl'}, 
    {map_name: 'lotus'}, 
])
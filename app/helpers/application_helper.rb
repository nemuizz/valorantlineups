module ApplicationHelper

  def agent_id_to_name(agent_id)
    agent = Agent.find(agent_id)
    return agent.agent_name
  end

  def map_id_to_name(map_id)
    map = Map.find(map_id)
    return map.map_name
  end
end

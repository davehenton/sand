module ApplicationHelper

	def query_top_tracks(token_code)
		token_response = HTTParty.post("https://accounts.spotify.com/api/token", body: { grant_type:"authorization_code", code: token_code, redirect_uri: "http://localhost:3000/welcome/landing" }, header: { authorization: "code" })
		token = token_response["access_token"]
		state_query = HTTParty.get("https://api.spotify.com/v1/search?q=california&limit=5&type=track", headers: { "Authorization" => "Bearer " + token })
		return state_query
	end
end


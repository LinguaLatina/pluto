### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ c73aabe0-439b-11eb-1338-4305012d89b1
begin 
	using DataFrames
	using CSV
	using HTTP
	using PlutoUI
end


# ╔═╡ 7989427e-4398-11eb-313b-adadfacc136a
#Set up environment
let
    import Pkg
	Pkg.add("HTTP")
	Pkg.add("CSV")
	Pkg.add("DataFrames")
	Pkg.add("PlutoUI")
end


# ╔═╡ 347616c4-439a-11eb-0d3a-01bcb67cd916
md"""## Quiz"""

# ╔═╡ 3e774f12-439a-11eb-0c04-4d3b0aab0c83
md"""

- [x] randomly select a question
- [x] use a checkbox to display an answer


"""

# ╔═╡ 8a8b2766-43b8-11eb-3710-3f0f5d8ac63f
@bind chooseOne Button("Next")

# ╔═╡ 579386ee-43ba-11eb-34e2-9f1a76ba7f96
html"<style> 
  .highlight { background: yellow; } 
  .note { -moz-border-radius: 6px;
     -webkit-border-radius: 6px;
     background-color: #eee;
     background-image: url(../Images/icons/Pencil-48.png);
     background-position: 9px 0px;
     background-repeat: no-repeat;
     border: solid 1px black;
     border-radius: 6px;
     line-height: 18px;
     overflow: hidden;
     padding: 15px 60px;
    font-style: italic;
 }
.instructions {
     background-color: #f0f7fb;
     background-image: url(../Images/icons/Pencil-48.png);
     background-position: 9px 0px;
     background-repeat: no-repeat;
     border-left: solid 4px #3498db;
     line-height: 18px;
     overflow: hidden;
     padding: 15px 60px;
   font-style: normal;
  }
  p { font-style: normal; }
</style>"

# ╔═╡ 255a897c-439a-11eb-0296-3b50ab99a42a
md"""Data"""

# ╔═╡ 73801d04-4399-11eb-15b4-9300a3d369b5
url = "https://raw.githubusercontent.com/LinguaLatina/textbook/master/quizbank/nom-gen-v4.csv"

# ╔═╡ ad402d3e-4399-11eb-371c-036814836e9f
csv = CSV.File(HTTP.get(url).body) |> Array



# ╔═╡ fef34710-4399-11eb-39bd-75b9f1e313e4
typeof(csv)

# ╔═╡ 3694c37a-43b7-11eb-097b-f713878406d9
csv[1].latin

# ╔═╡ 064b7046-43b8-11eb-2841-f12f51782954
max = size(csv)[1] - 1

# ╔═╡ 9c5fab88-43b8-11eb-2abc-39d058c47456
idx = begin
	chooseOne
	rand(0:max)
end

# ╔═╡ fd308eb4-43b8-11eb-004b-e9c7da50b65a
q = csv[idx].latin

# ╔═╡ e4d002c2-43bc-11eb-2501-479edadd2429
md"""Latin: *$q*  Show answer $(@bind showAnswer CheckBox())"""

# ╔═╡ 2247ebfc-43b9-11eb-0abf-ebf567821f40
a = csv[idx].english

# ╔═╡ e856b0e4-43b9-11eb-1d4f-8146770df6a0
function answerString()
	if showAnswer
		return md"""Answer **$a**"""
	else 
		return md""
	end
end

		

# ╔═╡ a9565b38-43b9-11eb-37d4-4b876c1405a2
answerString()

# ╔═╡ 44e66cfc-43b8-11eb-13c6-95316808174d
rand(0:max)

# ╔═╡ 0c3f852e-43b7-11eb-33ce-95044ad136d3
md"""Imports are in the following cell"""

# ╔═╡ Cell order:
# ╠═7989427e-4398-11eb-313b-adadfacc136a
# ╟─347616c4-439a-11eb-0d3a-01bcb67cd916
# ╠═3e774f12-439a-11eb-0c04-4d3b0aab0c83
# ╟─8a8b2766-43b8-11eb-3710-3f0f5d8ac63f
# ╟─e4d002c2-43bc-11eb-2501-479edadd2429
# ╟─a9565b38-43b9-11eb-37d4-4b876c1405a2
# ╟─e856b0e4-43b9-11eb-1d4f-8146770df6a0
# ╟─579386ee-43ba-11eb-34e2-9f1a76ba7f96
# ╟─fd308eb4-43b8-11eb-004b-e9c7da50b65a
# ╟─2247ebfc-43b9-11eb-0abf-ebf567821f40
# ╟─9c5fab88-43b8-11eb-2abc-39d058c47456
# ╟─255a897c-439a-11eb-0296-3b50ab99a42a
# ╟─73801d04-4399-11eb-15b4-9300a3d369b5
# ╠═ad402d3e-4399-11eb-371c-036814836e9f
# ╟─fef34710-4399-11eb-39bd-75b9f1e313e4
# ╠═3694c37a-43b7-11eb-097b-f713878406d9
# ╠═064b7046-43b8-11eb-2841-f12f51782954
# ╠═44e66cfc-43b8-11eb-13c6-95316808174d
# ╟─0c3f852e-43b7-11eb-33ce-95044ad136d3
# ╠═c73aabe0-439b-11eb-1338-4305012d89b1

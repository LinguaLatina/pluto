### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ c73aabe0-439b-11eb-1338-4305012d89b1
begin 
	using DataFrames
	using CSV
	using HTTP
end


# ╔═╡ 7989427e-4398-11eb-313b-adadfacc136a
#Set up environment
let
    import Pkg
	Pkg.add("HTTP")
	Pkg.add("CSV")
	Pkg.add("DataFrames")
end


# ╔═╡ 347616c4-439a-11eb-0d3a-01bcb67cd916
md"""## Quiz"""

# ╔═╡ 3e774f12-439a-11eb-0c04-4d3b0aab0c83
md"""

- [ ] randomly select a question
- [ ] use a checkbox to display an answer


"""

# ╔═╡ 255a897c-439a-11eb-0296-3b50ab99a42a
md"""Data"""

# ╔═╡ 73801d04-4399-11eb-15b4-9300a3d369b5
url = "https://raw.githubusercontent.com/LinguaLatina/textbook/master/quizbank/nom-gen-v4.csv"

# ╔═╡ ad402d3e-4399-11eb-371c-036814836e9f
csv = CSV.File(HTTP.get(url).body) |> Array



# ╔═╡ 3b2afb1e-439b-11eb-30ae-6b7f6b664490
csv

# ╔═╡ fef34710-4399-11eb-39bd-75b9f1e313e4
typeof(csv)

# ╔═╡ 000b2334-439a-11eb-0136-919d78775160
md"""Imports"""

# ╔═╡ Cell order:
# ╠═7989427e-4398-11eb-313b-adadfacc136a
# ╟─347616c4-439a-11eb-0d3a-01bcb67cd916
# ╟─3e774f12-439a-11eb-0c04-4d3b0aab0c83
# ╠═3b2afb1e-439b-11eb-30ae-6b7f6b664490
# ╟─255a897c-439a-11eb-0296-3b50ab99a42a
# ╟─73801d04-4399-11eb-15b4-9300a3d369b5
# ╠═ad402d3e-4399-11eb-371c-036814836e9f
# ╠═fef34710-4399-11eb-39bd-75b9f1e313e4
# ╠═000b2334-439a-11eb-0136-919d78775160
# ╠═c73aabe0-439b-11eb-1338-4305012d89b1

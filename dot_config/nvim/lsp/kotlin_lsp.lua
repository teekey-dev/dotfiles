return {
	settings = {
		jetbrains = {
			kotlin = {
				hints = {
					settings = {
						types = {
							property = true,
							variable = true,
						},
						lambda = {
							["return"] = true,
						},
						value = {
							ranges = true,
						},
					},
					type = {
						["function"] = {
							["return"] = true,
							parameter = true,
						},
					},
					lambda = {
						receivers = {
							parameters = true,
						},
					},
					value = {
						["kotlin.time"] = true,
					},
					parameters = true,
					["parameters.compiled"] = true,
					["parameters.excluded"] = false,
				},
			},
		},
	},
}

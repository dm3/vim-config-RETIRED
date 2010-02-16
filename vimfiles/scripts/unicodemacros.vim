""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Unicode Macro Table
" ===================
"
" Version 0.1
"
" Copyright 2008 by Jakob Westhoff <jakob@php.net>
"
" Provided under the GPLv3 (http://www.gnu.org/licenses/gpl.txt).
"
" This script provides the needed functionality to easily register insert mode
" macros for useful Unicode characters as well as initial mapping tables for
" a mostly math oriented background.
"
"
" Instructions
" ------------
"
" Simple source the script inside your .vimrc to register the needed macros.
" You may then use any macro name listed below with a backslash in front of
" it, Therefore just typing "\alpha \beta \gamma" in insert mode would give
" you the following result: "α β γ".
"
" You may customize every mapping table to your linkings or add new ones. If
" you create new tables or extend the ones already present I would be grateful
" if you could send me a copy of your work, for everyone to benefit from.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""""""""

" You may specify a list of mappings to be loaded here. This might be useful,
" if you do not want to take advantage of all mappings to avoid conflicts by
" unwanted macro expansion.
        " 'CapitalGreekLetters',
        " 'GreekLetters',
        " 'SuperscriptCharacters',
        " 'SubscriptCharacters',
        " 'MathematicalNumberSets',
        " 'MathematicalOperators',
        " 'MathematicalSymbols',
let s:SelectedMappings = [
        \ "Lithuanian",
\]




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You should NOT change anything below this line, if you do not know what you
" are doing.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
" Unicode mappings
"""""""""""""""""""""""""""""""""""""""
let s:Lithuanian = {
    \ "sh": "š",
    \ "hz": "ž",
    \ "ch": "č",
    \ "aa": "ą",
    \ "ee": "ę",
    \ "ii": "į",
    \ "uu": "ų",
    \ "ui": "ū",
    \ "ei": "ė",
\}

let s:CapitalGreekLetters = {
	\ "capital_alpha":   "Α",
	\ "capital_beta":    "Β",
	\ "capital_gamma":   "Γ",
	\ "capital_delta":   "Δ",
	\ "capital_epsilon": "Ε",
	\ "captial_zeta":    "Ζ",
	\ "captial_eta":     "Η",
	\ "captial_theta":   "Θ",
	\ "capital_iota":    "Ι",
	\ "capital_kappa":   "Κ",
	\ "captial_lamda":   "Λ",
	\ "captial_mu":      "Μ",
	\ "captial_nu":      "Ν",
	\ "captial_xi":      "Ξ",
	\ "captial_omicron": "Ο",
	\ "capital_pi":      "Π",
	\ "capital_rho":     "Ρ",
	\ "capital_sigma":   "Σ",
	\ "capital_tau":     "Τ",
	\ "capital_upsilon": "Υ",
	\ "capital_phi":     "Φ",
	\ "capital_chi":     "Χ",
	\ "capital_psi":     "Ψ",
	\ "capital_omega":   "Ω",
\}

let s:GreekLetters = {
	\ "alpha":   "α",
	\ "beta":    "β",
	\ "gamma":   "γ",
	\ "delta":   "δ",
	\ "epsilon": "ε",
	\ "zeta":    "ζ",
	\ "eta":     "η",
	\ "theta":   "θ",
	\ "iota":    "ι",
	\ "kappa":   "κ",
	\ "lamda":   "λ",
	\ "mu":      "μ",
	\ "nu":      "ν",
	\ "xi":      "ξ",
	\ "omicron": "ο",
	\ "pi":      "π",
	\ "rho":     "ρ",
	\ "sigma":   "σ",
	\ "tau":     "τ",
	\ "upsilon": "υ",
	\ "phi":     "ϕ",
	\ "chi":     "χ",
	\ "psi":     "ψ",
	\ "omega":   "ω"
\}

let s:SuperscriptCharacters = {
	\ "sup_0": "⁰",
	\ "sup_1": "¹",
	\ "sup_2": "²",
	\ "sup_3": "³",
	\ "sup_4": "⁴",
	\ "sup_5": "⁵",
	\ "sup_6": "⁶",
	\ "sup_7": "⁷",
	\ "sup_8": "⁸",
	\ "sup_9": "⁹",
	\ "sup_+": "⁺",
	\ "sup_-": "⁻",
	\ "sup_=": "⁼",
	\ "sup_(": "⁽",
	\ "sup_)": "⁾",
	\ "sup_n": "ⁿ",
	\ "sup_i": "ⁱ",
\}

let s:SubscriptCharacters = {
	\ "sub_0": "₀",
	\ "sub_1": "₁",
	\ "sub_2": "₂",
	\ "sub_3": "₃",
	\ "sub_4": "₄",
	\ "sub_5": "₅",
	\ "sub_6": "₆",
	\ "sub_7": "₇",
	\ "sub_8": "₈",
	\ "sub_9": "₉",
	\ "sub_+": "₊",
	\ "sub_-": "₋",
	\ "sub_=": "₌",
	\ "sub_(": "₍",
	\ "sub_)": "₎",
\}

let s:MathematicalNumberSets = {
	\ "complex_numbers":  "ℂ",
	\ "natural_numbers":  "ℕ",
	\ "rational_numbers": "ℚ",
	\ "real_numbers":     "ℝ",
	\ "integer_numbers":  "ℤ",
\}

let s:MathematicalOperators = {
	\ "universal_quantifier":       "∀",
	\ "complement":                 "∁",
	\ "partial_differential":       "∂",
	\ "existential_quantifier":     "∃",
	\ "non_existential_quantifier": "∄",
	\ "null_set":                   "∅",
	\ "element_of":                 "∈",
	\ "not_element_of":             "∉",
	\ "contains":                   "∋",
	\ "does_not_contain":           "∌",
	\ "end_of_proof":               "∎",
	\ "product":                    "∏",
	\ "coproduct":                  "∐",
	\ "summation":                  "∑",
	\ "plus":                       "+",
	\ "minus":                      "−",
	\ "plus_minus":                 "∓",
	\ "division":                   "∕",
	\ "set_minus":                  "∖",
	\ "asterisk_operator":          "∗",
	\ "ring_operator":              "∘",
	\ "square_root":                "√",
	\ "cube_root":                  "∛",
	\ "fourth_root":                "∜",
	\ "proportional_to":            "∝",
	\ "infinity":                   "∞",
	\ "divides":                    "∣",
	\ "does_not_divide":            "∤",
	\ "and":                        "∧",
	\ "or":                         "∨",
	\ "intersection":               "∩",
	\ "union":                      "∪",
	\ "integral":                   "∫",
	\ "double_integral":            "∬",
	\ "triple_integral":            "∭",
	\ "equals":                     "=",
	\ "colon_equals":               "≔",
	\ "equals_colon":               "≕",
	\ "estimates":                  "≙",
	\ "equal_by_definition":        "≝",
	\ "not_equal":                  "≠",
	\ "identical":                  "≡",
	\ "not_identical":              "≢",
	\ "less":                       "<",
	\ "greater":                    ">",
	\ "less_or_equal":              "≤",
	\ "greater_or_equal":           "≥",
	\ "much_less":                  "≪",
	\ "much_greater":               "≫",
	\ "not_less":                   "≮",
	\ "not_greater":                "≯",
	\ "not_less_or_equal":          "≰",
	\ "not_greater_or_equal":       "≱",
	\ "precedes":                   "≺",
	\ "succeeds":                   "≻",
	\ "precedes_or_equal":          "≼",
	\ "succeeds_or_equal":          "≽",
	\ "does_not_precede":           "⊀",
	\ "does_not_succeed":           "⊁",
	\ "subset":                     "⊂",
	\ "superset":                   "⊃",
	\ "not_subset":                 "⊄",
	\ "not_superset":               "⊅",
	\ "subset_or_equal":            "⊆",
	\ "superset_or_equal":          "⊇",
	\ "not_subset_or_equal":        "⊈",
	\ "not_superset_or_equal":      "⊉",
	\ "circled_plus":               "⊕",
	\ "circled_minus":              "⊖",
	\ "circled_cross":              "⊗",
	\ "circled_dot":                "⊙",
	\ "circled_ring":               "⊚",
	\ "circled_asterisk":           "⊛",
	\ "circled_equals":             "⊜",
	\ "circled_dash":               "⊝",
	\ "implies":                    "⊢",
	\ "is_implied":                 "⊣",
	\ "true":                       "⊤",
	\ "false":                      "⊥",
	\ "models":                     "⊧",
	\ "does_not_imply":             "⊬",
	\ "original_of":                "⊶",
	\ "image_of":                   "⊷",
	\ "xor":                        "⊻",
	\ "nand":                       "⊼",
	\ "nor":                        "⊽",
\}

let s:MathematicalSymbols = {
	\ "permille": "‰",
	\ "permyriad": "‱",
\}



"""""""""""""""""""""""""""""""""""""""
" Abbreviation registration
"""""""""""""""""""""""""""""""""""""""

" Register our escape char as valid keyword
execute "set iskeyword=" . escape( &iskeyword, '\' ) . ',\\'

" Combine all selected mappings in one dictionary for registration
let s:MacroMapping = {}
for dict in s:SelectedMappings
	execute "call extend( s:MacroMapping, s:" . dict . " )"
endfor

" Register every character mapping as abbreviation
for name in keys( s:MacroMapping )
	execute "iab " . '\' . name . " " . s:MacroMapping[name]
endfor

function! ReplaceKeys()
    for name in keys(s:MacroMapping)
        execute '%s/'.'\\'.name.'/'.s:MacroMapping[name].'/g'
    endfor
endfunction

function! ToggleUnicodeChar(word)
    if has_key(s:MacroMapping, expand(a:word))
        execute "s/".expand(a:word).'/'.s:MacroMapping[expand(a:word)]
    endif
endfunction


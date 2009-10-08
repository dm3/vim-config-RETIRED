<!-- quirksmode -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="icon" href="/hg.cgi/vim_erlang/static/hgicon.png" type="image/png">
<meta name="robots" content="index, nofollow" />
<link rel="stylesheet" href="/hg.cgi/vim_erlang/static/style-paper.css" type="text/css" />

<title>vim_erlang: 6fc74a717b5d ftplugin/erlang.vim</title>
</head>
<body>

<div class="container">
<div class="menu">
<div class="logo">
<a href="http://www.selenic.com/mercurial/">
<img src="/hg.cgi/vim_erlang/static/hglogo.png" width=75 height=90 border=0 alt="mercurial"></a>
</div>
<ul>
<li><a href="/hg.cgi/vim_erlang/shortlog/6fc74a717b5d">log</a></li>
<li><a href="/hg.cgi/vim_erlang/graph/6fc74a717b5d">graph</a></li>
<li><a href="/hg.cgi/vim_erlang/tags">tags</a></li>
</ul>
<ul>
<li><a href="/hg.cgi/vim_erlang/rev/6fc74a717b5d">changeset</a></li>
<li><a href="/hg.cgi/vim_erlang/file/6fc74a717b5d/ftplugin/">browse</a></li>
</ul>
<ul>
<li class="active">file</li>
<li><a href="/hg.cgi/vim_erlang/diff/6fc74a717b5d/ftplugin/erlang.vim">diff</a></li>
<li><a href="/hg.cgi/vim_erlang/annotate/6fc74a717b5d/ftplugin/erlang.vim">annotate</a></li>
<li><a href="/hg.cgi/vim_erlang/log/6fc74a717b5d/ftplugin/erlang.vim">file log</a></li>
<li><a href="/hg.cgi/vim_erlang/raw-file/6fc74a717b5d/ftplugin/erlang.vim">raw</a></li>
</ul>
</div>

<div class="main">
<h2><a href="/hg.cgi/vim_erlang/">vim_erlang</a></h2>
<h3>view ftplugin/erlang.vim @ 49:6fc74a717b5d</h3>

<form class="search" action="/hg.cgi/vim_erlang/log">

<p><input name="rev" id="search1" type="text" size="30"></p>
<span>find changesets by author, revision,
files, or words in the commit message</span>
</form>

<div class="description">Also highlight a bif name if it's followed by /[0-9]</div>

<table id="changesetEntry">
<tr>
 <th class="author">author</th>
 <td class="author">&#79;&#115;&#99;&#97;&#114;&#32;&#72;&#101;&#108;&#108;&#115;&#116;&#114;&#246;&#109;&#32;&#60;&#111;&#115;&#99;&#97;&#114;&#64;&#101;&#114;&#108;&#97;&#110;&#103;&#45;&#99;&#111;&#110;&#115;&#117;&#108;&#116;&#105;&#110;&#103;&#46;&#99;&#111;&#109;&#62;</td>
</tr>
<tr>
 <th class="date">date</th>
 <td class="date">Tue Apr 28 18:51:35 2009 +0100 (5 months ago)</td>
</tr>
<tr>
 <th class="author">parents</th>
 <td class="author"><a href="/hg.cgi/vim_erlang/file/03eb8e8877b7/ftplugin/erlang.vim">03eb8e8877b7</a> </td>
</tr>
<tr>
 <th class="author">children</th>
 <td class="author"></td>
</tr>

</table>

<div class="overflow">
<div class="sourcefirst"> line source</div>
<div class="parity0 source"><a href="#l1" id="l1">     1</a> &quot; Vim ftplugin file
</div><div class="parity1 source"><a href="#l2" id="l2">     2</a> &quot; Language:   Erlang
</div><div class="parity0 source"><a href="#l3" id="l3">     3</a> &quot; Maintainer: Oscar Hellström &lt;oscar@oscarh.net&gt;
</div><div class="parity1 source"><a href="#l4" id="l4">     4</a> &quot; URL:        http://personal.oscarh.net
</div><div class="parity0 source"><a href="#l5" id="l5">     5</a> &quot; Version:    2006-06-23
</div><div class="parity1 source"><a href="#l6" id="l6">     6</a> &quot; ------------------------------------------------------------------------------
</div><div class="parity0 source"><a href="#l7" id="l7">     7</a> &quot; Usage: {{{1
</div><div class="parity1 source"><a href="#l8" id="l8">     8</a> &quot;
</div><div class="parity0 source"><a href="#l9" id="l9">     9</a> &quot; To disable folding put
</div><div class="parity1 source"><a href="#l10" id="l10">    10</a> &quot; let g:erlangFold=0
</div><div class="parity0 source"><a href="#l11" id="l11">    11</a> &quot; in your vimrc
</div><div class="parity1 source"><a href="#l12" id="l12">    12</a> &quot;
</div><div class="parity0 source"><a href="#l13" id="l13">    13</a> &quot; Folding will make only one fold for a complete function, even though it has
</div><div class="parity1 source"><a href="#l14" id="l14">    14</a> &quot; more than one function head and body
</div><div class="parity0 source"><a href="#l15" id="l15">    15</a> &quot; To change this behaviour put
</div><div class="parity1 source"><a href="#l16" id="l16">    16</a> &quot; let g:erlangFoldSplitFunction=1
</div><div class="parity0 source"><a href="#l17" id="l17">    17</a> &quot; in your vimrc file
</div><div class="parity1 source"><a href="#l18" id="l18">    18</a> &quot;
</div><div class="parity0 source"><a href="#l19" id="l19">    19</a> &quot; }}}
</div><div class="parity1 source"><a href="#l20" id="l20">    20</a> &quot; ------------------------------------------------------------------------------
</div><div class="parity0 source"><a href="#l21" id="l21">    21</a> &quot; Plugin init {{{1
</div><div class="parity1 source"><a href="#l22" id="l22">    22</a> if exists(&quot;b:did_ftplugin&quot;)
</div><div class="parity0 source"><a href="#l23" id="l23">    23</a> 	finish
</div><div class="parity1 source"><a href="#l24" id="l24">    24</a> endif
</div><div class="parity0 source"><a href="#l25" id="l25">    25</a> 
</div><div class="parity1 source"><a href="#l26" id="l26">    26</a> &quot; Don't load any other
</div><div class="parity0 source"><a href="#l27" id="l27">    27</a> let b:did_ftplugin=1
</div><div class="parity1 source"><a href="#l28" id="l28">    28</a> 
</div><div class="parity0 source"><a href="#l29" id="l29">    29</a> if exists('s:doneFunctionDefinitions')
</div><div class="parity1 source"><a href="#l30" id="l30">    30</a> 	call s:SetErlangOptions()
</div><div class="parity0 source"><a href="#l31" id="l31">    31</a> 	finish
</div><div class="parity1 source"><a href="#l32" id="l32">    32</a> endif
</div><div class="parity0 source"><a href="#l33" id="l33">    33</a> 
</div><div class="parity1 source"><a href="#l34" id="l34">    34</a> let s:doneFunctionDefinitions=1
</div><div class="parity0 source"><a href="#l35" id="l35">    35</a> &quot; }}}
</div><div class="parity1 source"><a href="#l36" id="l36">    36</a> 
</div><div class="parity0 source"><a href="#l37" id="l37">    37</a> &quot; Local settings {{{1
</div><div class="parity1 source"><a href="#l38" id="l38">    38</a> &quot; Run Erlang make instead of GNU Make
</div><div class="parity0 source"><a href="#l39" id="l39">    39</a> function s:SetErlangOptions()
</div><div class="parity1 source"><a href="#l40" id="l40">    40</a> 	if version &gt;= 700
</div><div class="parity0 source"><a href="#l41" id="l41">    41</a> 		setlocal omnifunc=erlangcomplete#Complete
</div><div class="parity1 source"><a href="#l42" id="l42">    42</a> 	endif
</div><div class="parity0 source"><a href="#l43" id="l43">    43</a> 
</div><div class="parity1 source"><a href="#l44" id="l44">    44</a> 	&quot; {{{2 Settings for folding
</div><div class="parity0 source"><a href="#l45" id="l45">    45</a> 	if (!exists(&quot;g:erlangFold&quot;)) || g:erlangFold
</div><div class="parity1 source"><a href="#l46" id="l46">    46</a> 		setlocal foldmethod=expr
</div><div class="parity0 source"><a href="#l47" id="l47">    47</a> 		setlocal foldexpr=GetErlangFold(v:lnum)
</div><div class="parity1 source"><a href="#l48" id="l48">    48</a> 		setlocal foldtext=ErlangFoldText()
</div><div class="parity0 source"><a href="#l49" id="l49">    49</a> 		&quot;setlocal fml=2
</div><div class="parity1 source"><a href="#l50" id="l50">    50</a> 	endif
</div><div class="parity0 source"><a href="#l51" id="l51">    51</a> endfunction
</div><div class="parity1 source"><a href="#l52" id="l52">    52</a> 
</div><div class="parity0 source"><a href="#l53" id="l53">    53</a> 
</div><div class="parity1 source"><a href="#l54" id="l54">    54</a> &quot; Define folding functions {{{1
</div><div class="parity0 source"><a href="#l55" id="l55">    55</a> if !exists(&quot;*GetErlangFold&quot;)
</div><div class="parity1 source"><a href="#l56" id="l56">    56</a> 	&quot; Folding params {{{2
</div><div class="parity0 source"><a href="#l57" id="l57">    57</a> 	&quot; FIXME: Could these be shared between scripts?
</div><div class="parity1 source"><a href="#l58" id="l58">    58</a> 	let s:ErlangFunEnd      = '^[^%]*\.\s*\(%.*\)\?$'
</div><div class="parity0 source"><a href="#l59" id="l59">    59</a> 	let s:ErlangFunHead     = '^\a\w*(.*)\(\s+when\s+.*\)\?\s\+-&gt;\s*$'
</div><div class="parity1 source"><a href="#l60" id="l60">    60</a> 	let s:ErlangBeginHead   = '^\a\w*(.*$'
</div><div class="parity0 source"><a href="#l61" id="l61">    61</a> 	let s:ErlangEndHead     = '^\s\+[a-zA-Z-_{}\[\], ]\+)\(\s+when\s+.*\)\?\s\+-&gt;\s\(%.*\)\?*$'
</div><div class="parity1 source"><a href="#l62" id="l62">    62</a> 	let s:ErlangBlankLine   = '^\s*\(%.*\)\?$'
</div><div class="parity0 source"><a href="#l63" id="l63">    63</a> 
</div><div class="parity1 source"><a href="#l64" id="l64">    64</a> 	&quot; Auxiliary fold functions {{{2 
</div><div class="parity0 source"><a href="#l65" id="l65">    65</a> 	function s:GetNextNonBlank(lnum)
</div><div class="parity1 source"><a href="#l66" id="l66">    66</a> 		let lnum = nextnonblank(a:lnum + 1)
</div><div class="parity0 source"><a href="#l67" id="l67">    67</a> 		let line = getline(lnum)
</div><div class="parity1 source"><a href="#l68" id="l68">    68</a> 		while line =~ s:ErlangBlankLine &amp;&amp; 0 != lnum
</div><div class="parity0 source"><a href="#l69" id="l69">    69</a> 			let lnum = nextnonblank(lnum + 1)
</div><div class="parity1 source"><a href="#l70" id="l70">    70</a> 			let line = getline(lnum)
</div><div class="parity0 source"><a href="#l71" id="l71">    71</a> 	   endwhile
</div><div class="parity1 source"><a href="#l72" id="l72">    72</a> 	   return lnum
</div><div class="parity0 source"><a href="#l73" id="l73">    73</a> 	endfunction
</div><div class="parity1 source"><a href="#l74" id="l74">    74</a> 
</div><div class="parity0 source"><a href="#l75" id="l75">    75</a> 	function s:GetFunName(str)
</div><div class="parity1 source"><a href="#l76" id="l76">    76</a> 		return matchstr(a:str, '^\a\w*(\@=')
</div><div class="parity0 source"><a href="#l77" id="l77">    77</a> 	endfunction
</div><div class="parity1 source"><a href="#l78" id="l78">    78</a> 
</div><div class="parity0 source"><a href="#l79" id="l79">    79</a> 	function s:GetFunArgs(str, lnum)
</div><div class="parity1 source"><a href="#l80" id="l80">    80</a> 		let str = a:str
</div><div class="parity0 source"><a href="#l81" id="l81">    81</a> 		let lnum = a:lnum
</div><div class="parity1 source"><a href="#l82" id="l82">    82</a> 		while str !~ '-&gt;\s*\(%.*\)\?$'
</div><div class="parity0 source"><a href="#l83" id="l83">    83</a> 			let lnum = s:GetNextNonBlank(lnum)
</div><div class="parity1 source"><a href="#l84" id="l84">    84</a> 			if 0 == lnum &quot; EOF
</div><div class="parity0 source"><a href="#l85" id="l85">    85</a> 				return &quot;&quot;
</div><div class="parity1 source"><a href="#l86" id="l86">    86</a> 			endif
</div><div class="parity0 source"><a href="#l87" id="l87">    87</a> 			let str .= getline(lnum)
</div><div class="parity1 source"><a href="#l88" id="l88">    88</a> 		endwhile
</div><div class="parity0 source"><a href="#l89" id="l89">    89</a> 		return matchstr(str, 
</div><div class="parity1 source"><a href="#l90" id="l90">    90</a> 			\ '\(^(\s*\)\@&lt;=.*\(\s*)\(\s\+when\s\+.*\)\?\s\+-&gt;\s*\(%.*\)\?$\)\@=')
</div><div class="parity0 source"><a href="#l91" id="l91">    91</a> 	endfunction
</div><div class="parity1 source"><a href="#l92" id="l92">    92</a> 
</div><div class="parity0 source"><a href="#l93" id="l93">    93</a> 	function s:CountFunArgs(arguments)
</div><div class="parity1 source"><a href="#l94" id="l94">    94</a> 		let pos = 0
</div><div class="parity0 source"><a href="#l95" id="l95">    95</a> 		let ac = 0 &quot; arg count
</div><div class="parity1 source"><a href="#l96" id="l96">    96</a> 		let arguments = a:arguments
</div><div class="parity0 source"><a href="#l97" id="l97">    97</a> 		
</div><div class="parity1 source"><a href="#l98" id="l98">    98</a> 		&quot; Change list / tuples into just one A(rgument)
</div><div class="parity0 source"><a href="#l99" id="l99">    99</a> 		let erlangTuple = '{\([A-Za-z_,|=\-\[\]]\|\s\)*}'
</div><div class="parity1 source"><a href="#l100" id="l100">   100</a> 		let erlangList  = '\[\([A-Za-z_,|=\-{}]\|\s\)*\]'
</div><div class="parity0 source"><a href="#l101" id="l101">   101</a> 
</div><div class="parity1 source"><a href="#l102" id="l102">   102</a> 		&quot; FIXME: Use searchpair?
</div><div class="parity0 source"><a href="#l103" id="l103">   103</a> 		while arguments =~ erlangTuple
</div><div class="parity1 source"><a href="#l104" id="l104">   104</a> 			let arguments = substitute(arguments, erlangTuple, &quot;A&quot;, &quot;g&quot;)
</div><div class="parity0 source"><a href="#l105" id="l105">   105</a> 		endwhile
</div><div class="parity1 source"><a href="#l106" id="l106">   106</a> 		&quot; FIXME: Use searchpair?
</div><div class="parity0 source"><a href="#l107" id="l107">   107</a> 		while arguments =~ erlangList
</div><div class="parity1 source"><a href="#l108" id="l108">   108</a> 			let arguments = substitute(arguments, erlangList, &quot;A&quot;, &quot;g&quot;)
</div><div class="parity0 source"><a href="#l109" id="l109">   109</a> 		endwhile
</div><div class="parity1 source"><a href="#l110" id="l110">   110</a> 		
</div><div class="parity0 source"><a href="#l111" id="l111">   111</a> 		let len = strlen(arguments)
</div><div class="parity1 source"><a href="#l112" id="l112">   112</a> 		while pos &lt; len &amp;&amp; pos &gt; -1
</div><div class="parity0 source"><a href="#l113" id="l113">   113</a> 			let ac += 1
</div><div class="parity1 source"><a href="#l114" id="l114">   114</a> 			let pos = matchend(arguments, ',\s*', pos)
</div><div class="parity0 source"><a href="#l115" id="l115">   115</a> 		endwhile
</div><div class="parity1 source"><a href="#l116" id="l116">   116</a> 		return ac
</div><div class="parity0 source"><a href="#l117" id="l117">   117</a> 	endfunction
</div><div class="parity1 source"><a href="#l118" id="l118">   118</a> 
</div><div class="parity0 source"><a href="#l119" id="l119">   119</a> 	&quot; Main fold function {{{2
</div><div class="parity1 source"><a href="#l120" id="l120">   120</a> 	function GetErlangFold(lnum)
</div><div class="parity0 source"><a href="#l121" id="l121">   121</a> 		let lnum = a:lnum
</div><div class="parity1 source"><a href="#l122" id="l122">   122</a> 		let line = getline(lnum)
</div><div class="parity0 source"><a href="#l123" id="l123">   123</a> 
</div><div class="parity1 source"><a href="#l124" id="l124">   124</a> 		&quot; Function head gives fold level 1 {{{3
</div><div class="parity0 source"><a href="#l125" id="l125">   125</a> 		if line=~ s:ErlangBeginHead
</div><div class="parity1 source"><a href="#l126" id="l126">   126</a> 			while line !~ s:ErlangEndHead
</div><div class="parity0 source"><a href="#l127" id="l127">   127</a> 				if 0 == lnum &quot; EOF / BOF
</div><div class="parity1 source"><a href="#l128" id="l128">   128</a> 					retun '='
</div><div class="parity0 source"><a href="#l129" id="l129">   129</a> 				endif
</div><div class="parity1 source"><a href="#l130" id="l130">   130</a> 				if line =~ s:ErlangFunEnd
</div><div class="parity0 source"><a href="#l131" id="l131">   131</a> 					return '='
</div><div class="parity1 source"><a href="#l132" id="l132">   132</a> 				endif
</div><div class="parity0 source"><a href="#l133" id="l133">   133</a> 				endif
</div><div class="parity1 source"><a href="#l134" id="l134">   134</a> 				let lnum = s:GetNextNonBlank(lnum)
</div><div class="parity0 source"><a href="#l135" id="l135">   135</a> 				let line = getline(lnum)
</div><div class="parity1 source"><a href="#l136" id="l136">   136</a> 			endwhile 
</div><div class="parity0 source"><a href="#l137" id="l137">   137</a> 			&quot; check if prev line was really end of function
</div><div class="parity1 source"><a href="#l138" id="l138">   138</a> 			let lnum = s:GetPrevNonBlank(a:lnum)
</div><div class="parity0 source"><a href="#l139" id="l139">   139</a> 			if exists(&quot;g:erlangFoldSplitFunction&quot;) &amp;&amp; g:erlangFoldSplitFunction
</div><div class="parity1 source"><a href="#l140" id="l140">   140</a> 				if getline(lnum) !~ s:ErlangFunEnd
</div><div class="parity0 source"><a href="#l141" id="l141">   141</a> 					return '='
</div><div class="parity1 source"><a href="#l142" id="l142">   142</a> 				endif
</div><div class="parity0 source"><a href="#l143" id="l143">   143</a> 			endif
</div><div class="parity1 source"><a href="#l144" id="l144">   144</a> 			return '1&gt;'
</div><div class="parity0 source"><a href="#l145" id="l145">   145</a> 		endif
</div><div class="parity1 source"><a href="#l146" id="l146">   146</a> 
</div><div class="parity0 source"><a href="#l147" id="l147">   147</a> 		&quot; End of function (only on . not ;) gives fold level 0 {{{3
</div><div class="parity1 source"><a href="#l148" id="l148">   148</a> 		if line =~ s:ErlangFunEnd
</div><div class="parity0 source"><a href="#l149" id="l149">   149</a> 			return '&lt;1'
</div><div class="parity1 source"><a href="#l150" id="l150">   150</a> 		endif
</div><div class="parity0 source"><a href="#l151" id="l151">   151</a> 
</div><div class="parity1 source"><a href="#l152" id="l152">   152</a> 		&quot; Check if line below is a new function head {{{3
</div><div class="parity0 source"><a href="#l153" id="l153">   153</a> 		&quot; Only used if we want to split folds for different function heads
</div><div class="parity1 source"><a href="#l154" id="l154">   154</a> 		&quot; Ignores blank lines
</div><div class="parity0 source"><a href="#l155" id="l155">   155</a> 		if exists(&quot;g:erlangFoldSplitFunction&quot;) &amp;&amp; g:erlangFoldSplitFunction
</div><div class="parity1 source"><a href="#l156" id="l156">   156</a> 			let lnum = s:GetNextNonBlank(lnum)
</div><div class="parity0 source"><a href="#l157" id="l157">   157</a> 
</div><div class="parity1 source"><a href="#l158" id="l158">   158</a> 			if 0 == lnum &quot; EOF
</div><div class="parity0 source"><a href="#l159" id="l159">   159</a> 				return '&lt;1'
</div><div class="parity1 source"><a href="#l160" id="l160">   160</a> 			endif
</div><div class="parity0 source"><a href="#l161" id="l161">   161</a> 
</div><div class="parity1 source"><a href="#l162" id="l162">   162</a> 			let line = getline(lnum)
</div><div class="parity0 source"><a href="#l163" id="l163">   163</a> 
</div><div class="parity1 source"><a href="#l164" id="l164">   164</a> 			&quot; End of prev function head (new function here), ending fold level 1
</div><div class="parity0 source"><a href="#l165" id="l165">   165</a> 			if line =~ s:ErlangFunHead || line =~ s:ErlangBeginHead
</div><div class="parity1 source"><a href="#l166" id="l166">   166</a> 				return '&lt;1'
</div><div class="parity0 source"><a href="#l167" id="l167">   167</a> 			endif
</div><div class="parity1 source"><a href="#l168" id="l168">   168</a> 		endif
</div><div class="parity0 source"><a href="#l169" id="l169">   169</a> 		
</div><div class="parity1 source"><a href="#l170" id="l170">   170</a> 		&quot; Otherwise use fold from previous line
</div><div class="parity0 source"><a href="#l171" id="l171">   171</a> 		return '='
</div><div class="parity1 source"><a href="#l172" id="l172">   172</a> 	endfunction
</div><div class="parity0 source"><a href="#l173" id="l173">   173</a> 
</div><div class="parity1 source"><a href="#l174" id="l174">   174</a> 	&quot; Erlang fold description (foldtext function) {{{2
</div><div class="parity0 source"><a href="#l175" id="l175">   175</a> 	function ErlangFoldText()
</div><div class="parity1 source"><a href="#l176" id="l176">   176</a> 		let foldlen = v:foldend - v:foldstart
</div><div class="parity0 source"><a href="#l177" id="l177">   177</a> 		if 1 &lt; foldlen
</div><div class="parity1 source"><a href="#l178" id="l178">   178</a> 			let lines = &quot;lines&quot;
</div><div class="parity0 source"><a href="#l179" id="l179">   179</a> 		else
</div><div class="parity1 source"><a href="#l180" id="l180">   180</a> 			let lines = &quot;line&quot;
</div><div class="parity0 source"><a href="#l181" id="l181">   181</a> 		endif
</div><div class="parity1 source"><a href="#l182" id="l182">   182</a> 		let line = getline(v:foldstart)
</div><div class="parity0 source"><a href="#l183" id="l183">   183</a> 		let name = s:GetFunName(line)
</div><div class="parity1 source"><a href="#l184" id="l184">   184</a> 		let arguments = s:GetFunArgs(strpart(line, strlen(name)), v:foldstart)
</div><div class="parity0 source"><a href="#l185" id="l185">   185</a> 		let argcount = s:CountFunArgs(arguments)
</div><div class="parity1 source"><a href="#l186" id="l186">   186</a> 		let retval = v:folddashes . &quot; &quot; . name . &quot;/&quot; . argcount
</div><div class="parity0 source"><a href="#l187" id="l187">   187</a> 		let retval .= &quot; (&quot; . foldlen . &quot; &quot; . lines . &quot;)&quot;
</div><div class="parity1 source"><a href="#l188" id="l188">   188</a> 		return retval
</div><div class="parity0 source"><a href="#l189" id="l189">   189</a> 	endfunction &quot; }}}
</div><div class="parity1 source"><a href="#l190" id="l190">   190</a> endif &quot; }}}
</div><div class="parity0 source"><a href="#l191" id="l191">   191</a> 
</div><div class="parity1 source"><a href="#l192" id="l192">   192</a> call s:SetErlangOptions()
</div><div class="parity0 source"><a href="#l193" id="l193">   193</a> 
</div><div class="parity1 source"><a href="#l194" id="l194">   194</a> &quot; Skeletons {{{1
</div><div class="parity0 source"><a href="#l195" id="l195">   195</a> function GenServer()
</div><div class="parity1 source"><a href="#l196" id="l196">   196</a> 	echo foo 
</div><div class="parity0 source"><a href="#l197" id="l197">   197</a> endfunction
</div><div class="parity1 source"><a href="#l198" id="l198">   198</a> &quot; }}}
</div><div class="parity0 source"><a href="#l199" id="l199">   199</a> 
</div><div class="parity1 source"><a href="#l200" id="l200">   200</a> &quot; vim: set foldmethod=marker:
</div>
<div class="sourcelast"></div>
</div>
</div>
</div>



</body>
</html>


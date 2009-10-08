<!-- quirksmode -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="icon" href="/hg.cgi/vim_erlang/static/hgicon.png" type="image/png">
<meta name="robots" content="index, nofollow" />
<link rel="stylesheet" href="/hg.cgi/vim_erlang/static/style-paper.css" type="text/css" />

<title>vim_erlang: 6fc74a717b5d autoload/erlangcomplete.vim</title>
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
<li><a href="/hg.cgi/vim_erlang/file/6fc74a717b5d/autoload/">browse</a></li>
</ul>
<ul>
<li class="active">file</li>
<li><a href="/hg.cgi/vim_erlang/diff/6fc74a717b5d/autoload/erlangcomplete.vim">diff</a></li>
<li><a href="/hg.cgi/vim_erlang/annotate/6fc74a717b5d/autoload/erlangcomplete.vim">annotate</a></li>
<li><a href="/hg.cgi/vim_erlang/log/6fc74a717b5d/autoload/erlangcomplete.vim">file log</a></li>
<li><a href="/hg.cgi/vim_erlang/raw-file/6fc74a717b5d/autoload/erlangcomplete.vim">raw</a></li>
</ul>
</div>

<div class="main">
<h2><a href="/hg.cgi/vim_erlang/">vim_erlang</a></h2>
<h3>view autoload/erlangcomplete.vim @ 49:6fc74a717b5d</h3>

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
 <td class="author"></td>
</tr>
<tr>
 <th class="author">children</th>
 <td class="author"></td>
</tr>

</table>

<div class="overflow">
<div class="sourcefirst"> line source</div>
<div class="parity0 source"><a href="#l1" id="l1">     1</a> &quot; ------------------------------------------------------------------------------
</div><div class="parity1 source"><a href="#l2" id="l2">     2</a> &quot; Vim omni-completion script
</div><div class="parity0 source"><a href="#l3" id="l3">     3</a> &quot; Author: Oscar Hellström
</div><div class="parity1 source"><a href="#l4" id="l4">     4</a> &quot; Email: oscar@oscarh.net
</div><div class="parity0 source"><a href="#l5" id="l5">     5</a> &quot; Version: 2006-06-23
</div><div class="parity1 source"><a href="#l6" id="l6">     6</a> &quot; ------------------------------------------------------------------------------
</div><div class="parity0 source"><a href="#l7" id="l7">     7</a> 
</div><div class="parity1 source"><a href="#l8" id="l8">     8</a> &quot; Patterns for completions {{{1
</div><div class="parity0 source"><a href="#l9" id="l9">     9</a> let s:erlangLocalFuncBeg    = '\(\&lt;[0-9A-Za-z_-]*\|\s*\)$'
</div><div class="parity1 source"><a href="#l10" id="l10">    10</a> let s:erlangExternalFuncBeg = '\&lt;[0-9A-Za-z_-]\+:[0-9A-Za-z_-]*$'
</div><div class="parity0 source"><a href="#l11" id="l11">    11</a> let s:ErlangBlankLine       = '^\s*\(%.*\)\?$'
</div><div class="parity1 source"><a href="#l12" id="l12">    12</a> 
</div><div class="parity0 source"><a href="#l13" id="l13">    13</a> &quot; Main function for completion {{{1
</div><div class="parity1 source"><a href="#l14" id="l14">    14</a> function! erlangcomplete#Complete(findstart, base)
</div><div class="parity0 source"><a href="#l15" id="l15">    15</a> 	&quot; 0) Init {{{2
</div><div class="parity1 source"><a href="#l16" id="l16">    16</a> 	let lnum = line('.')
</div><div class="parity0 source"><a href="#l17" id="l17">    17</a> 	let column = col('.') 
</div><div class="parity1 source"><a href="#l18" id="l18">    18</a> 	let line = strpart(getline('.'), 0, column - 1)
</div><div class="parity0 source"><a href="#l19" id="l19">    19</a> 
</div><div class="parity1 source"><a href="#l20" id="l20">    20</a> 	&quot; 1) First, check if completion is impossible {{{2
</div><div class="parity0 source"><a href="#l21" id="l21">    21</a> 	if line =~ '[^~\\]%'
</div><div class="parity1 source"><a href="#l22" id="l22">    22</a> 		return -1
</div><div class="parity0 source"><a href="#l23" id="l23">    23</a> 	endif
</div><div class="parity1 source"><a href="#l24" id="l24">    24</a> 
</div><div class="parity0 source"><a href="#l25" id="l25">    25</a> 	&quot;echo &quot;line[col - 1]:&quot; . line[column - 1] . &quot; line[col - 2]:&quot; . line[column - 2] .  &quot;\n&quot; . line . &quot;\n&quot;
</div><div class="parity1 source"><a href="#l26" id="l26">    26</a> 
</div><div class="parity0 source"><a href="#l27" id="l27">    27</a> 	&quot; 2) Check if the char to the left of us are part of a function call {{{2
</div><div class="parity1 source"><a href="#l28" id="l28">    28</a> 	&quot;
</div><div class="parity0 source"><a href="#l29" id="l29">    29</a> 	&quot; Nothing interesting is written at the char just before the cursor
</div><div class="parity1 source"><a href="#l30" id="l30">    30</a> 	&quot; This means _anything_ could be started here
</div><div class="parity0 source"><a href="#l31" id="l31">    31</a> 	&quot; In this case, keyword completion should probably be used,
</div><div class="parity1 source"><a href="#l32" id="l32">    32</a> 	&quot; for now we'll only try and complete local functions.
</div><div class="parity0 source"><a href="#l33" id="l33">    33</a> 	&quot; TODO: Examine if we can stare Identifiers end complete on them
</div><div class="parity1 source"><a href="#l34" id="l34">    34</a> 	&quot; Is this worth it? Is /completion/ of a &quot;blank&quot; wanted? Can we consider (
</div><div class="parity0 source"><a href="#l35" id="l35">    35</a> 	&quot; interesting and check if we are in a function call etc.?
</div><div class="parity1 source"><a href="#l36" id="l36">    36</a> 	if line[column - 2] !~ '[0-9A-Za-z:_-]'
</div><div class="parity0 source"><a href="#l37" id="l37">    37</a> 		if a:findstart
</div><div class="parity1 source"><a href="#l38" id="l38">    38</a> 			return column
</div><div class="parity0 source"><a href="#l39" id="l39">    39</a> 		else
</div><div class="parity1 source"><a href="#l40" id="l40">    40</a> 			return s:erlangFindLocalFunc(a:base)
</div><div class="parity0 source"><a href="#l41" id="l41">    41</a> 		endif
</div><div class="parity1 source"><a href="#l42" id="l42">    42</a> 	endif
</div><div class="parity0 source"><a href="#l43" id="l43">    43</a> 	
</div><div class="parity1 source"><a href="#l44" id="l44">    44</a> 
</div><div class="parity0 source"><a href="#l45" id="l45">    45</a> 	&quot; 3) Function in external module {{{2
</div><div class="parity1 source"><a href="#l46" id="l46">    46</a> 	if line =~ s:erlangExternalFuncBeg
</div><div class="parity0 source"><a href="#l47" id="l47">    47</a> 		let delimiter = match(line, ':[0-9A-Za-z_-]*$') + 1
</div><div class="parity1 source"><a href="#l48" id="l48">    48</a> 		if a:findstart
</div><div class="parity0 source"><a href="#l49" id="l49">    49</a> 			return delimiter
</div><div class="parity1 source"><a href="#l50" id="l50">    50</a> 		else
</div><div class="parity0 source"><a href="#l51" id="l51">    51</a> 			let module = matchstr(line, '\(\&lt;\)\@&lt;=[0-9A-Za-z_-]\+:\@=')
</div><div class="parity1 source"><a href="#l52" id="l52">    52</a> 			return s:erlangFindExternalFunc(module, a:base)
</div><div class="parity0 source"><a href="#l53" id="l53">    53</a> 		endif
</div><div class="parity1 source"><a href="#l54" id="l54">    54</a> 	endif
</div><div class="parity0 source"><a href="#l55" id="l55">    55</a> 
</div><div class="parity1 source"><a href="#l56" id="l56">    56</a> 	&quot; 4) Local function {{{2
</div><div class="parity0 source"><a href="#l57" id="l57">    57</a> 	if line =~ s:erlangLocalFuncBeg
</div><div class="parity1 source"><a href="#l58" id="l58">    58</a> 		let funcstart = match(line, ':\@&lt;![0-9A-Za-z_-]*$')
</div><div class="parity0 source"><a href="#l59" id="l59">    59</a> 		if a:findstart
</div><div class="parity1 source"><a href="#l60" id="l60">    60</a> 			return funcstart
</div><div class="parity0 source"><a href="#l61" id="l61">    61</a> 		else
</div><div class="parity1 source"><a href="#l62" id="l62">    62</a> 			return s:erlangFindLocalFunc(a:base)
</div><div class="parity0 source"><a href="#l63" id="l63">    63</a> 		endif
</div><div class="parity1 source"><a href="#l64" id="l64">    64</a> 	endif
</div><div class="parity0 source"><a href="#l65" id="l65">    65</a> 
</div><div class="parity1 source"><a href="#l66" id="l66">    66</a> 	&quot; 5) Unhandled situation {{{2
</div><div class="parity0 source"><a href="#l67" id="l67">    67</a> 	if a:findstart
</div><div class="parity1 source"><a href="#l68" id="l68">    68</a> 		return -1
</div><div class="parity0 source"><a href="#l69" id="l69">    69</a> 	else
</div><div class="parity1 source"><a href="#l70" id="l70">    70</a> 		return []
</div><div class="parity0 source"><a href="#l71" id="l71">    71</a> 	endif
</div><div class="parity1 source"><a href="#l72" id="l72">    72</a> endfunction
</div><div class="parity0 source"><a href="#l73" id="l73">    73</a> 
</div><div class="parity1 source"><a href="#l74" id="l74">    74</a> &quot; Auxiliary functions for completion {{{1 
</div><div class="parity0 source"><a href="#l75" id="l75">    75</a> &quot; Find the next non-blank line {{{2
</div><div class="parity1 source"><a href="#l76" id="l76">    76</a> function s:erlangFindNextNonBlank(lnum)
</div><div class="parity0 source"><a href="#l77" id="l77">    77</a> 	let lnum = nextnonblank(a:lnum + 1)
</div><div class="parity1 source"><a href="#l78" id="l78">    78</a> 	let line = getline(lnum)
</div><div class="parity0 source"><a href="#l79" id="l79">    79</a> 	while line =~ s:ErlangBlankLine &amp;&amp; 0 != lnum
</div><div class="parity1 source"><a href="#l80" id="l80">    80</a> 		let lnum = nextnonblank(lnum + 1)
</div><div class="parity0 source"><a href="#l81" id="l81">    81</a> 		let line = getline(lnum)
</div><div class="parity1 source"><a href="#l82" id="l82">    82</a>    endwhile
</div><div class="parity0 source"><a href="#l83" id="l83">    83</a>    return lnum
</div><div class="parity1 source"><a href="#l84" id="l84">    84</a> endfunction
</div><div class="parity0 source"><a href="#l85" id="l85">    85</a> 			
</div><div class="parity1 source"><a href="#l86" id="l86">    86</a> &quot; vim: foldmethod=marker:
</div><div class="parity0 source"><a href="#l87" id="l87">    87</a> &quot; Find external function names {{{2
</div><div class="parity1 source"><a href="#l88" id="l88">    88</a> function s:erlangFindExternalFunc(module, base)
</div><div class="parity0 source"><a href="#l89" id="l89">    89</a> 	let functions = []
</div><div class="parity1 source"><a href="#l90" id="l90">    90</a> 	return functions
</div><div class="parity0 source"><a href="#l91" id="l91">    91</a> endfunction
</div><div class="parity1 source"><a href="#l92" id="l92">    92</a> 
</div><div class="parity0 source"><a href="#l93" id="l93">    93</a> &quot; Find local function names {{{2
</div><div class="parity1 source"><a href="#l94" id="l94">    94</a> function s:erlangFindLocalFunc(base)
</div><div class="parity0 source"><a href="#l95" id="l95">    95</a> 	&quot; begin at line 1
</div><div class="parity1 source"><a href="#l96" id="l96">    96</a> 	let lnum = s:erlangFindNextNonBlank(1)
</div><div class="parity0 source"><a href="#l97" id="l97">    97</a> 	if &quot;&quot; == a:base
</div><div class="parity1 source"><a href="#l98" id="l98">    98</a> 		let base = '\w' &quot; used to match against word symbol
</div><div class="parity0 source"><a href="#l99" id="l99">    99</a> 	else
</div><div class="parity1 source"><a href="#l100" id="l100">   100</a> 		let base = a:base
</div><div class="parity0 source"><a href="#l101" id="l101">   101</a> 	endif
</div><div class="parity1 source"><a href="#l102" id="l102">   102</a> 	while 0 != lnum &amp;&amp; !complete_check()
</div><div class="parity0 source"><a href="#l103" id="l103">   103</a> 		let line = getline(lnum)
</div><div class="parity1 source"><a href="#l104" id="l104">   104</a> 		let function_name = matchstr(line, '^' . base . '[0-9A-Za-z_-]\+(\@=')
</div><div class="parity0 source"><a href="#l105" id="l105">   105</a> 		if function_name != &quot;&quot;
</div><div class="parity1 source"><a href="#l106" id="l106">   106</a> 			call complete_add(function_name)
</div><div class="parity0 source"><a href="#l107" id="l107">   107</a> 		endif
</div><div class="parity1 source"><a href="#l108" id="l108">   108</a> 		let lnum = s:erlangFindNextNonBlank(lnum)
</div><div class="parity0 source"><a href="#l109" id="l109">   109</a> 	endwhile
</div><div class="parity1 source"><a href="#l110" id="l110">   110</a> 	return []
</div><div class="parity0 source"><a href="#l111" id="l111">   111</a> endfunction
</div><div class="parity1 source"><a href="#l112" id="l112">   112</a> 
</div>
<div class="sourcelast"></div>
</div>
</div>
</div>



</body>
</html>


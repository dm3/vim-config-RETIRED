<!-- quirksmode -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="icon" href="/hg.cgi/vim_erlang/static/hgicon.png" type="image/png">
<meta name="robots" content="index, nofollow" />
<link rel="stylesheet" href="/hg.cgi/vim_erlang/static/style-paper.css" type="text/css" />

<title>vim_erlang: 6fc74a717b5d indent/erlang.vim</title>
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
<li><a href="/hg.cgi/vim_erlang/file/6fc74a717b5d/indent/">browse</a></li>
</ul>
<ul>
<li class="active">file</li>
<li><a href="/hg.cgi/vim_erlang/diff/6fc74a717b5d/indent/erlang.vim">diff</a></li>
<li><a href="/hg.cgi/vim_erlang/annotate/6fc74a717b5d/indent/erlang.vim">annotate</a></li>
<li><a href="/hg.cgi/vim_erlang/log/6fc74a717b5d/indent/erlang.vim">file log</a></li>
<li><a href="/hg.cgi/vim_erlang/raw-file/6fc74a717b5d/indent/erlang.vim">raw</a></li>
</ul>
</div>

<div class="main">
<h2><a href="/hg.cgi/vim_erlang/">vim_erlang</a></h2>
<h3>view indent/erlang.vim @ 49:6fc74a717b5d</h3>

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
<div class="parity0 source"><a href="#l1" id="l1">     1</a> &quot; Vim indent file
</div><div class="parity1 source"><a href="#l2" id="l2">     2</a> &quot; Language:     Erlang
</div><div class="parity0 source"><a href="#l3" id="l3">     3</a> &quot; Maintainer:   Csaba Hoch &lt;csaba.hoch@gmail.com&gt;
</div><div class="parity1 source"><a href="#l4" id="l4">     4</a> &quot; Contributor:  Edwin Fine &lt;efine145_nospam01 at usa dot net&gt;
</div><div class="parity0 source"><a href="#l5" id="l5">     5</a> &quot; Last Change:  2008 Mar 12
</div><div class="parity1 source"><a href="#l6" id="l6">     6</a> 
</div><div class="parity0 source"><a href="#l7" id="l7">     7</a> &quot; Only load this indent file when no other was loaded.
</div><div class="parity1 source"><a href="#l8" id="l8">     8</a> if exists(&quot;b:did_indent&quot;)
</div><div class="parity0 source"><a href="#l9" id="l9">     9</a>   finish
</div><div class="parity1 source"><a href="#l10" id="l10">    10</a> endif
</div><div class="parity0 source"><a href="#l11" id="l11">    11</a> let b:did_indent = 1
</div><div class="parity1 source"><a href="#l12" id="l12">    12</a> 
</div><div class="parity0 source"><a href="#l13" id="l13">    13</a> setlocal indentexpr=ErlangIndent()
</div><div class="parity1 source"><a href="#l14" id="l14">    14</a> setlocal indentkeys+==after,=end,=catch,=),=],=}
</div><div class="parity0 source"><a href="#l15" id="l15">    15</a> 
</div><div class="parity1 source"><a href="#l16" id="l16">    16</a> &quot; Only define the functions once.
</div><div class="parity0 source"><a href="#l17" id="l17">    17</a> if exists(&quot;*ErlangIndent&quot;)
</div><div class="parity1 source"><a href="#l18" id="l18">    18</a>    finish
</div><div class="parity0 source"><a href="#l19" id="l19">    19</a> endif
</div><div class="parity1 source"><a href="#l20" id="l20">    20</a> 
</div><div class="parity0 source"><a href="#l21" id="l21">    21</a> &quot; The function go through the whole line, analyses it and sets the indentation
</div><div class="parity1 source"><a href="#l22" id="l22">    22</a> &quot; (ind variable).
</div><div class="parity0 source"><a href="#l23" id="l23">    23</a> &quot; l: the number of the line to be examined.
</div><div class="parity1 source"><a href="#l24" id="l24">    24</a> function s:ErlangIndentAtferLine(l)
</div><div class="parity0 source"><a href="#l25" id="l25">    25</a>     let i = 0 &quot; the index of the current character in the line
</div><div class="parity1 source"><a href="#l26" id="l26">    26</a>     let length = strlen(a:l) &quot; the length of the line
</div><div class="parity0 source"><a href="#l27" id="l27">    27</a>     let ind = 0 &quot; how much should be the difference between the indentation of
</div><div class="parity1 source"><a href="#l28" id="l28">    28</a>                 &quot; the current line and the indentation of the next line?
</div><div class="parity0 source"><a href="#l29" id="l29">    29</a>                 &quot; e.g. +1: the indentation of the next line should be equal to
</div><div class="parity1 source"><a href="#l30" id="l30">    30</a>                 &quot; the indentation of the current line plus one shiftwidth
</div><div class="parity0 source"><a href="#l31" id="l31">    31</a>     let lastFun = 0 &quot; the last token was a 'fun'
</div><div class="parity1 source"><a href="#l32" id="l32">    32</a>     let lastReceive = 0 &quot; the last token was a 'receive'; needed for 'after'
</div><div class="parity0 source"><a href="#l33" id="l33">    33</a>     let lastHashMark = 0 &quot; the last token was a 'hashmark'
</div><div class="parity1 source"><a href="#l34" id="l34">    34</a> 
</div><div class="parity0 source"><a href="#l35" id="l35">    35</a>     while 0&lt;= i &amp;&amp; i &lt; length
</div><div class="parity1 source"><a href="#l36" id="l36">    36</a> 
</div><div class="parity0 source"><a href="#l37" id="l37">    37</a>         &quot; m: the next value of the i
</div><div class="parity1 source"><a href="#l38" id="l38">    38</a>         if a:l[i] == '%'
</div><div class="parity0 source"><a href="#l39" id="l39">    39</a>             break
</div><div class="parity1 source"><a href="#l40" id="l40">    40</a>         elseif a:l[i] == '&quot;'
</div><div class="parity0 source"><a href="#l41" id="l41">    41</a>             let m = matchend(a:l,'&quot;\%([^&quot;\\]\|\\.\)*&quot;',i)
</div><div class="parity1 source"><a href="#l42" id="l42">    42</a>             let lastReceive = 0
</div><div class="parity0 source"><a href="#l43" id="l43">    43</a>         elseif a:l[i] == &quot;'&quot;
</div><div class="parity1 source"><a href="#l44" id="l44">    44</a>             let m = matchend(a:l,&quot;'[^']*'&quot;,i)
</div><div class="parity0 source"><a href="#l45" id="l45">    45</a>             let lastReceive = 0
</div><div class="parity1 source"><a href="#l46" id="l46">    46</a>         elseif a:l[i] =~# &quot;[a-z]&quot;
</div><div class="parity0 source"><a href="#l47" id="l47">    47</a>             let m = matchend(a:l,&quot;.[[:alnum:]_]*&quot;,i)
</div><div class="parity1 source"><a href="#l48" id="l48">    48</a>             if lastFun
</div><div class="parity0 source"><a href="#l49" id="l49">    49</a>                 let ind = ind - 1
</div><div class="parity1 source"><a href="#l50" id="l50">    50</a>                 let lastFun = 0
</div><div class="parity0 source"><a href="#l51" id="l51">    51</a>                 let lastReceive = 0
</div><div class="parity1 source"><a href="#l52" id="l52">    52</a>             elseif a:l[(i):(m-1)] =~# '^\%(case\|if\|try\)$'
</div><div class="parity0 source"><a href="#l53" id="l53">    53</a>                 let ind = ind + 1
</div><div class="parity1 source"><a href="#l54" id="l54">    54</a>             elseif a:l[(i):(m-1)] =~# '^receive$'
</div><div class="parity0 source"><a href="#l55" id="l55">    55</a>                 let ind = ind + 1
</div><div class="parity1 source"><a href="#l56" id="l56">    56</a>                 let lastReceive = 1
</div><div class="parity0 source"><a href="#l57" id="l57">    57</a>             elseif a:l[(i):(m-1)] =~# '^begin$'
</div><div class="parity1 source"><a href="#l58" id="l58">    58</a>                 let ind = ind + 2
</div><div class="parity0 source"><a href="#l59" id="l59">    59</a>                 let lastReceive = 0
</div><div class="parity1 source"><a href="#l60" id="l60">    60</a>             elseif a:l[(i):(m-1)] =~# '^end$'
</div><div class="parity0 source"><a href="#l61" id="l61">    61</a>                 let ind = ind - 2
</div><div class="parity1 source"><a href="#l62" id="l62">    62</a>                 let lastReceive = 0
</div><div class="parity0 source"><a href="#l63" id="l63">    63</a>             elseif a:l[(i):(m-1)] =~# '^after$'
</div><div class="parity1 source"><a href="#l64" id="l64">    64</a>                 if lastReceive == 0
</div><div class="parity0 source"><a href="#l65" id="l65">    65</a>                     let ind = ind - 1
</div><div class="parity1 source"><a href="#l66" id="l66">    66</a>                 else
</div><div class="parity0 source"><a href="#l67" id="l67">    67</a>                     let ind = ind + 0
</div><div class="parity1 source"><a href="#l68" id="l68">    68</a>                 end
</div><div class="parity0 source"><a href="#l69" id="l69">    69</a>                 let lastReceive = 0
</div><div class="parity1 source"><a href="#l70" id="l70">    70</a>             elseif a:l[(i):(m-1)] =~# '^fun$'
</div><div class="parity0 source"><a href="#l71" id="l71">    71</a>                 let ind = ind + 1
</div><div class="parity1 source"><a href="#l72" id="l72">    72</a>                 let lastFun = 1
</div><div class="parity0 source"><a href="#l73" id="l73">    73</a>                 let lastReceive = 0
</div><div class="parity1 source"><a href="#l74" id="l74">    74</a>             endif
</div><div class="parity0 source"><a href="#l75" id="l75">    75</a>         elseif a:l[i] =~# &quot;[A-Z_]&quot;
</div><div class="parity1 source"><a href="#l76" id="l76">    76</a>             let m = matchend(a:l,&quot;.[[:alnum:]_]*&quot;,i)
</div><div class="parity0 source"><a href="#l77" id="l77">    77</a>             let lastReceive = 0
</div><div class="parity1 source"><a href="#l78" id="l78">    78</a>         elseif a:l[i] == '$'
</div><div class="parity0 source"><a href="#l79" id="l79">    79</a>             let m = i+2
</div><div class="parity1 source"><a href="#l80" id="l80">    80</a>             let lastReceive = 0
</div><div class="parity0 source"><a href="#l81" id="l81">    81</a>         elseif a:l[i] == &quot;.&quot; &amp;&amp; (i+1&gt;=length || a:l[i+1]!~ &quot;[0-9]&quot;)
</div><div class="parity1 source"><a href="#l82" id="l82">    82</a>             let m = i+1
</div><div class="parity0 source"><a href="#l83" id="l83">    83</a>             if lastHashMark
</div><div class="parity1 source"><a href="#l84" id="l84">    84</a>                 let lastHashMark = 0
</div><div class="parity0 source"><a href="#l85" id="l85">    85</a>             else
</div><div class="parity1 source"><a href="#l86" id="l86">    86</a>                 let ind = ind - 1
</div><div class="parity0 source"><a href="#l87" id="l87">    87</a>             end
</div><div class="parity1 source"><a href="#l88" id="l88">    88</a>             let lastReceive = 0
</div><div class="parity0 source"><a href="#l89" id="l89">    89</a>         elseif a:l[i] == '-' &amp;&amp; (i+1&lt;length &amp;&amp; a:l[i+1]=='&gt;')
</div><div class="parity1 source"><a href="#l90" id="l90">    90</a>             let m = i+2
</div><div class="parity0 source"><a href="#l91" id="l91">    91</a>             let ind = ind + 1
</div><div class="parity1 source"><a href="#l92" id="l92">    92</a>             let lastReceive = 0
</div><div class="parity0 source"><a href="#l93" id="l93">    93</a>         elseif a:l[i] == ';'
</div><div class="parity1 source"><a href="#l94" id="l94">    94</a>             let m = i+1
</div><div class="parity0 source"><a href="#l95" id="l95">    95</a>             let ind = ind - 1
</div><div class="parity1 source"><a href="#l96" id="l96">    96</a>             let lastReceive = 0
</div><div class="parity0 source"><a href="#l97" id="l97">    97</a>         elseif a:l[i] == '#'
</div><div class="parity1 source"><a href="#l98" id="l98">    98</a>             let m = i+1
</div><div class="parity0 source"><a href="#l99" id="l99">    99</a>             let lastHashMark = 1
</div><div class="parity1 source"><a href="#l100" id="l100">   100</a>         elseif a:l[i] =~# '[({[]'
</div><div class="parity0 source"><a href="#l101" id="l101">   101</a>             let m = i+1
</div><div class="parity1 source"><a href="#l102" id="l102">   102</a>             let ind = ind + 1
</div><div class="parity0 source"><a href="#l103" id="l103">   103</a>             let lastFun = 0
</div><div class="parity1 source"><a href="#l104" id="l104">   104</a>             let lastReceive = 0
</div><div class="parity0 source"><a href="#l105" id="l105">   105</a>             let lastHashMark = 0
</div><div class="parity1 source"><a href="#l106" id="l106">   106</a>         elseif a:l[i] =~# '[)}\]]'
</div><div class="parity0 source"><a href="#l107" id="l107">   107</a>             let m = i+1
</div><div class="parity1 source"><a href="#l108" id="l108">   108</a>             let ind = ind - 1
</div><div class="parity0 source"><a href="#l109" id="l109">   109</a>             let lastReceive = 0
</div><div class="parity1 source"><a href="#l110" id="l110">   110</a>         else
</div><div class="parity0 source"><a href="#l111" id="l111">   111</a>             let m = i+1
</div><div class="parity1 source"><a href="#l112" id="l112">   112</a>         endif
</div><div class="parity0 source"><a href="#l113" id="l113">   113</a> 
</div><div class="parity1 source"><a href="#l114" id="l114">   114</a>         let i = m
</div><div class="parity0 source"><a href="#l115" id="l115">   115</a> 
</div><div class="parity1 source"><a href="#l116" id="l116">   116</a>     endwhile
</div><div class="parity0 source"><a href="#l117" id="l117">   117</a> 
</div><div class="parity1 source"><a href="#l118" id="l118">   118</a>     return ind
</div><div class="parity0 source"><a href="#l119" id="l119">   119</a> 
</div><div class="parity1 source"><a href="#l120" id="l120">   120</a> endfunction
</div><div class="parity0 source"><a href="#l121" id="l121">   121</a> 
</div><div class="parity1 source"><a href="#l122" id="l122">   122</a> function s:FindPrevNonBlankNonComment(lnum)
</div><div class="parity0 source"><a href="#l123" id="l123">   123</a>     let lnum = prevnonblank(a:lnum)
</div><div class="parity1 source"><a href="#l124" id="l124">   124</a>     let line = getline(lnum)
</div><div class="parity0 source"><a href="#l125" id="l125">   125</a>     &quot; continue to search above if the current line begins with a '%'
</div><div class="parity1 source"><a href="#l126" id="l126">   126</a>     while line =~# '^\s*%.*$'
</div><div class="parity0 source"><a href="#l127" id="l127">   127</a>         let lnum = prevnonblank(lnum - 1)
</div><div class="parity1 source"><a href="#l128" id="l128">   128</a>         if 0 == lnum
</div><div class="parity0 source"><a href="#l129" id="l129">   129</a>             return 0
</div><div class="parity1 source"><a href="#l130" id="l130">   130</a>         endif
</div><div class="parity0 source"><a href="#l131" id="l131">   131</a>         let line = getline(lnum)
</div><div class="parity1 source"><a href="#l132" id="l132">   132</a>     endwhile
</div><div class="parity0 source"><a href="#l133" id="l133">   133</a>     return lnum
</div><div class="parity1 source"><a href="#l134" id="l134">   134</a> endfunction
</div><div class="parity0 source"><a href="#l135" id="l135">   135</a> 
</div><div class="parity1 source"><a href="#l136" id="l136">   136</a> function ErlangIndent()
</div><div class="parity0 source"><a href="#l137" id="l137">   137</a> 
</div><div class="parity1 source"><a href="#l138" id="l138">   138</a>     &quot; Find a non-blank line above the current line.
</div><div class="parity0 source"><a href="#l139" id="l139">   139</a>     let lnum = prevnonblank(v:lnum - 1)
</div><div class="parity1 source"><a href="#l140" id="l140">   140</a> 
</div><div class="parity0 source"><a href="#l141" id="l141">   141</a>     &quot; Hit the start of the file, use zero indent.
</div><div class="parity1 source"><a href="#l142" id="l142">   142</a>     if lnum == 0
</div><div class="parity0 source"><a href="#l143" id="l143">   143</a>         return 0
</div><div class="parity1 source"><a href="#l144" id="l144">   144</a>     endif
</div><div class="parity0 source"><a href="#l145" id="l145">   145</a> 
</div><div class="parity1 source"><a href="#l146" id="l146">   146</a>     let prevline = getline(lnum)
</div><div class="parity0 source"><a href="#l147" id="l147">   147</a>     let currline = getline(v:lnum)
</div><div class="parity1 source"><a href="#l148" id="l148">   148</a> 
</div><div class="parity0 source"><a href="#l149" id="l149">   149</a>     let ind = indent(lnum) + &amp;sw * s:ErlangIndentAtferLine(prevline)
</div><div class="parity1 source"><a href="#l150" id="l150">   150</a> 
</div><div class="parity0 source"><a href="#l151" id="l151">   151</a>     &quot; special cases:
</div><div class="parity1 source"><a href="#l152" id="l152">   152</a>     if prevline =~# '^\s*\%(after\|end\)\&gt;'
</div><div class="parity0 source"><a href="#l153" id="l153">   153</a>         let ind = ind + 2*&amp;sw
</div><div class="parity1 source"><a href="#l154" id="l154">   154</a>     endif
</div><div class="parity0 source"><a href="#l155" id="l155">   155</a>     if currline =~# '^\s*end\&gt;'
</div><div class="parity1 source"><a href="#l156" id="l156">   156</a>         let ind = ind - 2*&amp;sw
</div><div class="parity0 source"><a href="#l157" id="l157">   157</a>     endif
</div><div class="parity1 source"><a href="#l158" id="l158">   158</a>     if currline =~# '^\s*after\&gt;'
</div><div class="parity0 source"><a href="#l159" id="l159">   159</a>         let plnum = s:FindPrevNonBlankNonComment(v:lnum-1)
</div><div class="parity1 source"><a href="#l160" id="l160">   160</a>         if getline(plnum) =~# '^[^%]*\&lt;receive\&gt;\s*\%(%.*\)\=$'
</div><div class="parity0 source"><a href="#l161" id="l161">   161</a>             let ind = ind - 1*&amp;sw
</div><div class="parity1 source"><a href="#l162" id="l162">   162</a>             &quot; If the 'receive' is not in the same line as the 'after'
</div><div class="parity0 source"><a href="#l163" id="l163">   163</a>         else
</div><div class="parity1 source"><a href="#l164" id="l164">   164</a>             let ind = ind - 2*&amp;sw
</div><div class="parity0 source"><a href="#l165" id="l165">   165</a>         endif
</div><div class="parity1 source"><a href="#l166" id="l166">   166</a>     endif
</div><div class="parity0 source"><a href="#l167" id="l167">   167</a>     if prevline =~# '^\s*[)}\]]'
</div><div class="parity1 source"><a href="#l168" id="l168">   168</a>         let ind = ind + 1*&amp;sw
</div><div class="parity0 source"><a href="#l169" id="l169">   169</a>     endif
</div><div class="parity1 source"><a href="#l170" id="l170">   170</a>     if currline =~# '^\s*[)}\]]'
</div><div class="parity0 source"><a href="#l171" id="l171">   171</a>         let ind = ind - 1*&amp;sw
</div><div class="parity1 source"><a href="#l172" id="l172">   172</a>     endif
</div><div class="parity0 source"><a href="#l173" id="l173">   173</a>     if prevline =~# '^\s*\%(catch\)\s*\%(%\|$\)'
</div><div class="parity1 source"><a href="#l174" id="l174">   174</a>         let ind = ind + 1*&amp;sw
</div><div class="parity0 source"><a href="#l175" id="l175">   175</a>     endif
</div><div class="parity1 source"><a href="#l176" id="l176">   176</a>     if currline =~# '^\s*\%(catch\)\s*\%(%\|$\)'
</div><div class="parity0 source"><a href="#l177" id="l177">   177</a>         let ind = ind - 1*&amp;sw
</div><div class="parity1 source"><a href="#l178" id="l178">   178</a>     endif
</div><div class="parity0 source"><a href="#l179" id="l179">   179</a> 
</div><div class="parity1 source"><a href="#l180" id="l180">   180</a>     if ind&lt;0
</div><div class="parity0 source"><a href="#l181" id="l181">   181</a>         let ind = 0
</div><div class="parity1 source"><a href="#l182" id="l182">   182</a>     endif
</div><div class="parity0 source"><a href="#l183" id="l183">   183</a>     return ind
</div><div class="parity1 source"><a href="#l184" id="l184">   184</a> 
</div><div class="parity0 source"><a href="#l185" id="l185">   185</a> endfunction
</div><div class="parity1 source"><a href="#l186" id="l186">   186</a> 
</div><div class="parity0 source"><a href="#l187" id="l187">   187</a> &quot; TODO:
</div><div class="parity1 source"><a href="#l188" id="l188">   188</a> &quot; 
</div><div class="parity0 source"><a href="#l189" id="l189">   189</a> &quot; f() -&gt;
</div><div class="parity1 source"><a href="#l190" id="l190">   190</a> &quot;     x(&quot;foo
</div><div class="parity0 source"><a href="#l191" id="l191">   191</a> &quot;         bar&quot;)
</div><div class="parity1 source"><a href="#l192" id="l192">   192</a> &quot;         ,
</div><div class="parity0 source"><a href="#l193" id="l193">   193</a> &quot;         bad_indent.
</div><div class="parity1 source"><a href="#l194" id="l194">   194</a> &quot;
</div><div class="parity0 source"><a href="#l195" id="l195">   195</a> &quot; fun
</div><div class="parity1 source"><a href="#l196" id="l196">   196</a> &quot;     init/0,
</div><div class="parity0 source"><a href="#l197" id="l197">   197</a> &quot;     bad_indent
</div><div class="parity1 source"><a href="#l198" id="l198">   198</a> &quot;
</div><div class="parity0 source"><a href="#l199" id="l199">   199</a> &quot;     #rec
</div><div class="parity1 source"><a href="#l200" id="l200">   200</a> &quot;     .field,
</div><div class="parity0 source"><a href="#l201" id="l201">   201</a> &quot; bad_indent
</div><div class="parity1 source"><a href="#l202" id="l202">   202</a> &quot;
</div><div class="parity0 source"><a href="#l203" id="l203">   203</a> &quot; case X of
</div><div class="parity1 source"><a href="#l204" id="l204">   204</a> &quot;     1 when A; B -&gt;
</div><div class="parity0 source"><a href="#l205" id="l205">   205</a> &quot;     bad_indent
</div><div class="parity1 source"><a href="#l206" id="l206">   206</a> 
</div>
<div class="sourcelast"></div>
</div>
</div>
</div>



</body>
</html>


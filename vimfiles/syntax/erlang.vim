<!-- quirksmode -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="icon" href="/hg.cgi/vim_erlang/static/hgicon.png" type="image/png">
<meta name="robots" content="index, nofollow" />
<link rel="stylesheet" href="/hg.cgi/vim_erlang/static/style-paper.css" type="text/css" />

<title>vim_erlang: 6fc74a717b5d syntax/erlang.vim</title>
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
<li><a href="/hg.cgi/vim_erlang/file/6fc74a717b5d/syntax/">browse</a></li>
</ul>
<ul>
<li class="active">file</li>
<li><a href="/hg.cgi/vim_erlang/diff/6fc74a717b5d/syntax/erlang.vim">diff</a></li>
<li><a href="/hg.cgi/vim_erlang/annotate/6fc74a717b5d/syntax/erlang.vim">annotate</a></li>
<li><a href="/hg.cgi/vim_erlang/log/6fc74a717b5d/syntax/erlang.vim">file log</a></li>
<li><a href="/hg.cgi/vim_erlang/raw-file/6fc74a717b5d/syntax/erlang.vim">raw</a></li>
</ul>
</div>

<div class="main">
<h2><a href="/hg.cgi/vim_erlang/">vim_erlang</a></h2>
<h3>view syntax/erlang.vim @ 49:6fc74a717b5d</h3>

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
 <td class="author"><a href="/hg.cgi/vim_erlang/file/2d53989fcb8f/syntax/erlang.vim">2d53989fcb8f</a> </td>
</tr>
<tr>
 <th class="author">children</th>
 <td class="author"></td>
</tr>

</table>

<div class="overflow">
<div class="sourcefirst"> line source</div>
<div class="parity0 source"><a href="#l1" id="l1">     1</a> &quot; Vim syntax file
</div><div class="parity1 source"><a href="#l2" id="l2">     2</a> &quot; Language:   Erlang
</div><div class="parity0 source"><a href="#l3" id="l3">     3</a> &quot; Maintainer: Oscar Hellström &lt;oscar@oscarh.net&gt;
</div><div class="parity1 source"><a href="#l4" id="l4">     4</a> &quot; URL:        http://oscar.hellstrom.st
</div><div class="parity0 source"><a href="#l5" id="l5">     5</a> &quot; Version:    2007-10-12
</div><div class="parity1 source"><a href="#l6" id="l6">     6</a> &quot; ------------------------------------------------------------------------------
</div><div class="parity0 source"><a href="#l7" id="l7">     7</a> &quot; {{{1
</div><div class="parity1 source"><a href="#l8" id="l8">     8</a> &quot; Options:
</div><div class="parity0 source"><a href="#l9" id="l9">     9</a> &quot;
</div><div class="parity1 source"><a href="#l10" id="l10">    10</a> &quot; Erlang BIFs
</div><div class="parity0 source"><a href="#l11" id="l11">    11</a> &quot; g:erlangHighlightBif - highlight erlang built in functions (default: off)
</div><div class="parity1 source"><a href="#l12" id="l12">    12</a> &quot;
</div><div class="parity0 source"><a href="#l13" id="l13">    13</a> &quot; }}}
</div><div class="parity1 source"><a href="#l14" id="l14">    14</a> &quot; -----------------------------------------------------------------------------
</div><div class="parity0 source"><a href="#l15" id="l15">    15</a> 
</div><div class="parity1 source"><a href="#l16" id="l16">    16</a> &quot; Setup {{{1
</div><div class="parity0 source"><a href="#l17" id="l17">    17</a> &quot; For version 5.x: Clear all syntax items
</div><div class="parity1 source"><a href="#l18" id="l18">    18</a> &quot; For version 6.x: Quit when a syntax file was already loaded
</div><div class="parity0 source"><a href="#l19" id="l19">    19</a> if version &lt; 600
</div><div class="parity1 source"><a href="#l20" id="l20">    20</a>   syntax clear
</div><div class="parity0 source"><a href="#l21" id="l21">    21</a> elseif exists(&quot;b:current_syntax&quot;)
</div><div class="parity1 source"><a href="#l22" id="l22">    22</a>   finish
</div><div class="parity0 source"><a href="#l23" id="l23">    23</a> endif
</div><div class="parity1 source"><a href="#l24" id="l24">    24</a> 
</div><div class="parity0 source"><a href="#l25" id="l25">    25</a> &quot; Erlang is case sensitive
</div><div class="parity1 source"><a href="#l26" id="l26">    26</a> syn case match
</div><div class="parity0 source"><a href="#l27" id="l27">    27</a> 
</div><div class="parity1 source"><a href="#l28" id="l28">    28</a> &quot; Match groups {{{1
</div><div class="parity0 source"><a href="#l29" id="l29">    29</a> syn match erlangStringModifier               /\\./ contained
</div><div class="parity1 source"><a href="#l30" id="l30">    30</a> syn match erlangStringModifier               /\~\%(-\?[0-9*]\+\)\?\%(\.[0-9*]\+\..\?\)\?\%(c\|f\|e\|g\|s\|w\|p\|W\|P\|B\|X\|#\|b\|+\|n\|i\)/
</div><div class="parity0 source"><a href="#l31" id="l31">    31</a> syn match erlangModifier                     /\$\\\?./
</div><div class="parity1 source"><a href="#l32" id="l32">    32</a> 
</div><div class="parity0 source"><a href="#l33" id="l33">    33</a> syn match erlangInteger                      /\&lt;\%([0-9]\+#[0-9a-fA-F]\+\|[0-9]\+\)\&gt;/
</div><div class="parity1 source"><a href="#l34" id="l34">    34</a> syn match erlangFloat                        /\&lt;[0-9]\+\.[0-9]\+\%(e-\?[0-9]\+\)\?\&gt;/
</div><div class="parity0 source"><a href="#l35" id="l35">    35</a> 
</div><div class="parity1 source"><a href="#l36" id="l36">    36</a> syn keyword erlangTodo                       TODO FIXME XXX contained
</div><div class="parity0 source"><a href="#l37" id="l37">    37</a> syn match erlangComment                      /%.*$/ contains=@Spell,erlangTodo
</div><div class="parity1 source"><a href="#l38" id="l38">    38</a> 
</div><div class="parity0 source"><a href="#l39" id="l39">    39</a> syn keyword erlangKeyword                    band bor bnot bsl bsr bxor div rem xor
</div><div class="parity1 source"><a href="#l40" id="l40">    40</a> syn keyword erlangKeyword                    try catch begin receive after cond fun let query
</div><div class="parity0 source"><a href="#l41" id="l41">    41</a> 
</div><div class="parity1 source"><a href="#l42" id="l42">    42</a> syn keyword erlangConditional                case if of end
</div><div class="parity0 source"><a href="#l43" id="l43">    43</a> syn keyword erlangConditional                not and or andalso orelse
</div><div class="parity1 source"><a href="#l44" id="l44">    44</a> syn keyword erlangConditional                when
</div><div class="parity0 source"><a href="#l45" id="l45">    45</a> 
</div><div class="parity1 source"><a href="#l46" id="l46">    46</a> syn keyword erlangBoolean                    true false
</div><div class="parity0 source"><a href="#l47" id="l47">    47</a> 
</div><div class="parity1 source"><a href="#l48" id="l48">    48</a> syn keyword erlangGuard                      is_list is_atom is_binary is_boolean is_tuple is_number is_integer is_float is_function is_constant is_pid is_port is_reference is_record is_process_alive
</div><div class="parity0 source"><a href="#l49" id="l49">    49</a> 
</div><div class="parity1 source"><a href="#l50" id="l50">    50</a> syn match erlangOperator                     /\/\|*\|+\|-\|++\|--/
</div><div class="parity0 source"><a href="#l51" id="l51">    51</a> syn match erlangOperator                     /-&gt;\|&lt;-\|||\||\|!\|=/
</div><div class="parity1 source"><a href="#l52" id="l52">    52</a> syn match erlangOperator                     /=:=\|==\|\/=\|=\/=\|&lt;\|&gt;\|=&lt;\|&gt;=/
</div><div class="parity0 source"><a href="#l53" id="l53">    53</a> syn keyword erlangOperator                   div rem
</div><div class="parity1 source"><a href="#l54" id="l54">    54</a> 
</div><div class="parity0 source"><a href="#l55" id="l55">    55</a> syn region erlangString                      start=/&quot;/ end=/&quot;/ skip=/\\/ contains=@Spell,erlangStringModifier
</div><div class="parity1 source"><a href="#l56" id="l56">    56</a> 
</div><div class="parity0 source"><a href="#l57" id="l57">    57</a> syn match erlangVariable                     /\&lt;[A-Z_]\w*\&gt;/
</div><div class="parity1 source"><a href="#l58" id="l58">    58</a> syn match erlangAtom                         /\%(\%(^-\)\|#\)\@&lt;!\&lt;[a-z]\w*\&gt;(\@!/
</div><div class="parity0 source"><a href="#l59" id="l59">    59</a> syn match erlangAtom                         /\\\@&lt;!'[^']*\\\@&lt;!'/
</div><div class="parity1 source"><a href="#l60" id="l60">    60</a> 
</div><div class="parity0 source"><a href="#l61" id="l61">    61</a> syn match erlangRecord                       /#\w\+/
</div><div class="parity1 source"><a href="#l62" id="l62">    62</a> 
</div><div class="parity0 source"><a href="#l63" id="l63">    63</a> syn match erlangTuple                        /{\|}/
</div><div class="parity1 source"><a href="#l64" id="l64">    64</a> syn match erlangList                         /\[\|\]/
</div><div class="parity0 source"><a href="#l65" id="l65">    65</a> 
</div><div class="parity1 source"><a href="#l66" id="l66">    66</a> syn match erlangAttribute                    /^-\%(vsn\|author\|copyright\|compile\|deprecated\|module\|export\|import\|behaviour\) *(\@=/
</div><div class="parity0 source"><a href="#l67" id="l67">    67</a> syn match erlangInclude                      /^-include\%(_lib\)\? *(\@=/
</div><div class="parity1 source"><a href="#l68" id="l68">    68</a> syn match erlangRecordDef                    /^-record *(\@=/
</div><div class="parity0 source"><a href="#l69" id="l69">    69</a> syn match erlangDefine                       /^-define *(\@=/
</div><div class="parity1 source"><a href="#l70" id="l70">    70</a> syn match erlangPreCondit                    /^-\%(ifdef\|ifndef\|endif\) *(\@=/
</div><div class="parity0 source"><a href="#l71" id="l71">    71</a> 
</div><div class="parity1 source"><a href="#l72" id="l72">    72</a> syn match erlangType                         /^-\%(spec\|type\)[( ]\@=/
</div><div class="parity0 source"><a href="#l73" id="l73">    73</a> 
</div><div class="parity1 source"><a href="#l74" id="l74">    74</a> syn match erlangMacro                        /\%(-define(\)\@&lt;=\w\+/
</div><div class="parity0 source"><a href="#l75" id="l75">    75</a> syn match erlangMacro                        /?\w\+/
</div><div class="parity1 source"><a href="#l76" id="l76">    76</a> 
</div><div class="parity0 source"><a href="#l77" id="l77">    77</a> syn match erlangBitType                      /\%(\/\|-\)\@&lt;=\%(binary\|integer\|float\|unit\)/
</div><div class="parity1 source"><a href="#l78" id="l78">    78</a> syn match erlangBitSize                      /:\@&lt;=[0-9]\+/
</div><div class="parity0 source"><a href="#l79" id="l79">    79</a> 
</div><div class="parity1 source"><a href="#l80" id="l80">    80</a> syn match erlangBinary                      /&lt;&lt;\|&gt;&gt;/
</div><div class="parity0 source"><a href="#l81" id="l81">    81</a> 
</div><div class="parity1 source"><a href="#l82" id="l82">    82</a> &quot; BIFS
</div><div class="parity0 source"><a href="#l83" id="l83">    83</a> syn match erlangBIF                          /\%([^:0-9A-Za-z_]\|\&lt;erlang:\)\@&lt;=\%(abs\|apply\|atom_to_list\|binary_to_list\|binary_to_term\|check_process_code\|concat_binary\|date\|delete_module\|disconnect_node\|element\|erase\|exit\|float\|float_to_list\|garbage_collect\|get\|get_keys\|group_leader\|halt\|hd\|integer_to_list\|iolist_to_binary\|iolist_size\|length\|link\|list_to_atom\|list_to_binary\|list_to_existing_atom\|list_to_float\|list_to_integer\|list_to_pid\|list_to_tuple\|load_module\|make_ref\|monitor_node\|node\|nodes\|now\|open_port\|pid_to_list\|port_close\|port_command\|port_connect\|port_control\|pre_loaded\|process_flag\|process_info\|processes\|purge_module\|put\|register\|registered\|round\|self\|setelement\|size\|spawn\|spawn_link\|spawn_opt\|split_binary\|statistics\|term_to_binary\|throw\|time\|tl\|trunc\|tuple_to_list\|unlink\|unregister\|whereis\)\((\|\/[0-9]\)\@=/
</div><div class="parity1 source"><a href="#l84" id="l84">    84</a> syn match erlangBif                          /\&lt;\%(erlang:\)\@&lt;=\%(append_element\|bump_reductions\|cancel_timer\|demonitor\|display\|error\|fault\|fun_info\|fun_to_list\|function_exported\|get_cookie\|get_stacktrace\|hash\|hibernate\|info\|is_builtin\|loaded\|localtime\|localtime_to_universaltime\|localtime_to_universaltime\|make_tuple\|md5\|md5_init\|md5_update\|memory\|monitor\|monitor_node\|phash\|phash2\|port_call\|port_info\|port_to_list\|ports\|process_display\|raise\|read_timer\|ref_to_list\|resume_process\|send\|send_after\|send_nosuspend\|set_cookie\|spawn_monitor\|start_timer\|suspend_process\|system_flag\|system_info\|system_monitor\|trace\|trace_delivered\|trace_info\|trace_pattern\|universaltime\|universaltime_to_localtime\|yield\)(\@=/
</div><div class="parity0 source"><a href="#l85" id="l85">    85</a> syn match erlangBif                          /erlang\(:\w\)\@=/
</div><div class="parity1 source"><a href="#l86" id="l86">    86</a> &quot; }}}
</div><div class="parity0 source"><a href="#l87" id="l87">    87</a> 
</div><div class="parity1 source"><a href="#l88" id="l88">    88</a> &quot; Link Erlang stuff to Vim groups {{{1
</div><div class="parity0 source"><a href="#l89" id="l89">    89</a> hi link erlangTodo           Todo
</div><div class="parity1 source"><a href="#l90" id="l90">    90</a> hi link erlangString         String
</div><div class="parity0 source"><a href="#l91" id="l91">    91</a> hi link erlangNoSpellString  String 
</div><div class="parity1 source"><a href="#l92" id="l92">    92</a> hi link erlangModifier       SpecialChar
</div><div class="parity0 source"><a href="#l93" id="l93">    93</a> hi link erlangStringModifier SpecialChar
</div><div class="parity1 source"><a href="#l94" id="l94">    94</a> hi link erlangComment        Comment
</div><div class="parity0 source"><a href="#l95" id="l95">    95</a> hi link erlangVariable       Identifier
</div><div class="parity1 source"><a href="#l96" id="l96">    96</a> hi link erlangInclude        Include
</div><div class="parity0 source"><a href="#l97" id="l97">    97</a> hi link erlangRecordDef      Keyword
</div><div class="parity1 source"><a href="#l98" id="l98">    98</a> hi link erlangAttribute      Keyword
</div><div class="parity0 source"><a href="#l99" id="l99">    99</a> hi link erlangKeyword        Keyword
</div><div class="parity1 source"><a href="#l100" id="l100">   100</a> hi link erlangMacro          Macro
</div><div class="parity0 source"><a href="#l101" id="l101">   101</a> hi link erlangDefine         Define
</div><div class="parity1 source"><a href="#l102" id="l102">   102</a> hi link erlangPreCondit      PreCondit
</div><div class="parity0 source"><a href="#l103" id="l103">   103</a> hi link erlangPreProc        PreProc
</div><div class="parity1 source"><a href="#l104" id="l104">   104</a> hi link erlangDelimiter      Delimiter
</div><div class="parity0 source"><a href="#l105" id="l105">   105</a> hi link erlangBitDelimiter   Normal
</div><div class="parity1 source"><a href="#l106" id="l106">   106</a> hi link erlangOperator       Operator
</div><div class="parity0 source"><a href="#l107" id="l107">   107</a> hi link erlangConditional    Conditional
</div><div class="parity1 source"><a href="#l108" id="l108">   108</a> hi link erlangGuard          Conditional
</div><div class="parity0 source"><a href="#l109" id="l109">   109</a> hi link erlangBoolean        Boolean
</div><div class="parity1 source"><a href="#l110" id="l110">   110</a> hi link erlangAtom           Normal
</div><div class="parity0 source"><a href="#l111" id="l111">   111</a> hi link erlangRecord         Structure
</div><div class="parity1 source"><a href="#l112" id="l112">   112</a> hi link erlangInteger        Number
</div><div class="parity0 source"><a href="#l113" id="l113">   113</a> hi link erlangFloat          Number
</div><div class="parity1 source"><a href="#l114" id="l114">   114</a> hi link erlangFloat          Number
</div><div class="parity0 source"><a href="#l115" id="l115">   115</a> hi link erlangFloat          Number
</div><div class="parity1 source"><a href="#l116" id="l116">   116</a> hi link erlangFloat          Number
</div><div class="parity0 source"><a href="#l117" id="l117">   117</a> hi link erlangHex            Number
</div><div class="parity1 source"><a href="#l118" id="l118">   118</a> hi link erlangBIF            Keyword
</div><div class="parity0 source"><a href="#l119" id="l119">   119</a> hi link erlangFun            Keyword
</div><div class="parity1 source"><a href="#l120" id="l120">   120</a> hi link erlangList           Delimiter
</div><div class="parity0 source"><a href="#l121" id="l121">   121</a> hi link erlangTuple          Delimiter
</div><div class="parity1 source"><a href="#l122" id="l122">   122</a> hi link erlangBinary         Keyword
</div><div class="parity0 source"><a href="#l123" id="l123">   123</a> hi link erlangBitVariable    Identifier
</div><div class="parity1 source"><a href="#l124" id="l124">   124</a> hi link erlangBitType        Type
</div><div class="parity0 source"><a href="#l125" id="l125">   125</a> hi link erlangType           Type
</div><div class="parity1 source"><a href="#l126" id="l126">   126</a> hi link erlangBitSize        Number
</div><div class="parity0 source"><a href="#l127" id="l127">   127</a> &quot; }}}
</div><div class="parity1 source"><a href="#l128" id="l128">   128</a> 
</div><div class="parity0 source"><a href="#l129" id="l129">   129</a> &quot; Optional linkings {{{1
</div><div class="parity1 source"><a href="#l130" id="l130">   130</a> if exists(&quot;g:erlangHighlightBif&quot;) &amp;&amp; g:erlangHighlightBif
</div><div class="parity0 source"><a href="#l131" id="l131">   131</a> 	hi link erlangGBIF           Keyword
</div><div class="parity1 source"><a href="#l132" id="l132">   132</a> endif
</div><div class="parity0 source"><a href="#l133" id="l133">   133</a> &quot; }}}
</div><div class="parity1 source"><a href="#l134" id="l134">   134</a> 
</div><div class="parity0 source"><a href="#l135" id="l135">   135</a> let b:current_syntax = &quot;erlang&quot;
</div><div class="parity1 source"><a href="#l136" id="l136">   136</a> 
</div><div class="parity0 source"><a href="#l137" id="l137">   137</a> &quot; vim: set foldmethod=marker:
</div>
<div class="sourcelast"></div>
</div>
</div>
</div>



</body>
</html>


userCustom.onPagedownConfigure=function(e){var t={num:0},n={num:0},r={thm:{title:"Theorem",counter:t},lem:{title:"Lemma",counter:t},cor:{title:"Corollary",counter:t},prop:{title:"Property",counter:t},defn:{title:"Definition",counter:t},rem:{title:"Remark",counter:t},prob:{title:"Problem",counter:n},excs:{title:"Exercise",counter:n},examp:{title:"Example",counter:n},proof:{title:"Proof"}},o=e.getConverter(),l=o.hooks.preConversion;o.hooks.preConversion=function(e){return e=(e=e.replace(/\\begin{(\w+)}([\s\S]*?)\\end{\1}/g,function(e,t,n){return r[t]?"/begin{"+t+"}"+n+"/end{"+t+"}":e})).replace(/\\(\w+){([^\r\n}]+)}/g,function(e,t,n){return"section"==t?"\n###     "+n+"\n":"subsection"==t?"\n####       "+n+"\n":"subsubsection"==t?"\n#####         "+n+"\n":"title"==t?"\n##    "+n+"\n":e}),l(e)},o.hooks.chain("preBlockGamut",function(e,t){return(e=(e=e.replace(/\\ref{(\w+):(\d+)}/g,function(e,t,n){return r[t]?'<a class="latex_ref" href="#'+t+":"+n+'">'+r[t].title+" "+n+"</a>":e})).replace(/\\(author|date){([\s\S]*?)}/g,'<div class="latex_$1">$2</div>')).replace(/\/begin{(\w+)}([\s\S]*?)\/end{\1}/g,function(e,n,o){if(!r[n])return e;var l='<div class="latex_'+n+'"><span class="latex_title"></span>'+t(o);return"proof"==n&&(l+='<span class="latex_proofend" style="float:right">$\u25a0$</span>'),l+"</div>"})});var a=document.getElementById("preview-contents");e.hooks.chain("onPreviewRefresh",function(){t.num=0,n.num=0,_.each(a.querySelectorAll('[class^="latex_"]'),function(e){var t=e.className.match(/^latex_(\S+)/)[1],n=r[t];if(n){var o=n.title;n.counter&&(n.counter.num++,o+=" "+n.counter.num,e.id=t+":"+n.counter.num),e.querySelector(".latex_title").innerHTML=o+"."}})})},userCustom.onReady=function(){var e=[".latex_thm, .latex_lem, .latex_cor, .latex_defn, .latex_prop, .latex_rem {","    font-style:italic;","    display: block;","    margin:15px 0;","}",".latex_prob, .latex_examp, .latex_excs, .latex_proof {","    font-style:normal;","    margin: 10px 0;","    display: block;","}",".latex_title {","    float:left;","    font-weight:bold;","    padding-right: 10px;","}",".latex_proofend {","    float:right;","}"].join("\n");$("head").append($('<style type="text/css">').html(e))},document.addEventListener("DOMContentLoaded",function(){function e(e){return e.replace(/\\begin{(\w+)}([\s\S]*?)\\end{\1}/g,function(e,n,r){if(!t[n])return console.error(`Unknown environment '${n}'`),e;var o=t[n],l=o.title;return o.counter&&(o.counter.num++,l+=" "+o.counter.num),`<div class="latex_${n}">\n                            <span class="latex_title">${l}.</span>\n                            ${r}\n                        </div>`})}var t={thm:{title:"Theorem",counter:{num:0}},proof:{title:"Proof"},excs:{title:"Exercise",counter:{num:0}}},n=document.getElementById("preview-contents"),r=e(document.getElementById("markdown-content").innerHTML);n.innerHTML=r});
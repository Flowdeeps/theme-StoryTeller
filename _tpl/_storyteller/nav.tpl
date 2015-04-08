{{*


<header{{ if $gimme->article->nav }} class="nav"{{ /if }}>
       <a href="/" id="home">Home</a>
       {{ if $gimme->article->nav }}
       <!-- a href="#" id="collapse"></a-->
       {{ $cover = 0 }}
   <nav>
     <ul>
           {{ if $gimme->article->display_title }}
             {{ assign var="artTitle" value=$gimme->article->display_title }}
           {{ else }}
             {{ assign var="artTitle" value=$gimme->article->name }}
           {{ /if }}
           {{ if !$gimme->article->dont_show_in_nav }}
             <li ><a href="#{{ $gimme->article->number }}" title="{{ $artTitle }}"> <p class="cover">{{ $artTitle }}</p></a></li>
             {{ $cover = 1 }}
           {{ /if }}

       {{ $i = 1 }}
       {{ $j = 0 }}

       {{ list_related_articles }}
           {{ if $gimme->current_list->at_beginning && !$cover }}
           <nav>
               <ul>
           {{ /if }}

           {{ if $gimme->article->display_title }}
             {{ assign var="artTitle" value=$gimme->article->display_title }}
           {{ else }}
             {{ assign var="artTitle" value=$gimme->article->name }}
           {{ /if }}

           {{ if $gimme->article->chapter_head }}
           {{ if $i > 1 }}
     </li>
     {{ /if }}
           {{ if $j >= 1 }}
             </ul>
           {{ $j = 0 }}
           {{ /if }}
                   <li><a href="#{{ $gimme->article->number }}" title="{{ $artTitle }}"><span>{{ $i }}</span> <p>{{ $artTitle }}</p></a>
                   {{ $i = $i+1 }}
                   {{ capture name="chapImage" assign="chapImage" }}{{ strip }}
                   {{ image rendition="sidebar" }}<figure><a href="#{{ $gimme->article->number }}" title="{{ $artTitle }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" /></a></figure>{{ /image }}
                   {{ /strip }}{{ /capture }}

           {{ elseif !$gimme->article->dont_show_in_nav }}
           {{ $j = $j+1 }}
           {{ if $j == 1 }}
             <ul>
             {{ $chapImage }}
           {{ /if }}
                   <li class="child"><a href="#{{ $gimme->article->number }}" title="{{ $artTitle }}"> {{ $artTitle }}</a></li>

           {{ /if }}

           {{ if $gimme->current_list->at_end }}
               </li>
               </ul>
           </nav>
           {{ /if }}
       {{ /list_related_articles }}
       {{ /if }}
       <a href="#" class="mute">Mute</a>
       {{ assign var="l" value="0" }}
       {{ assign var="currLan" value=$gimme->language->code }}

   </header>

   *}}
xquery version '1.0-ml';

(: Code sample for 'Tweet analysis with XQuery: the highlights of #mluc11' (http://grtjn.blogspot.com/)
 : A bit crude, but it should work.. in MarkLogic Server..
 :)

declare variable $mode := xdmp:get-request-field("mode");
declare variable $filter := xdmp:get-request-field("filter");

declare variable $tweets :=
<tweets>
   <tweet url="http://twitter.com/jpcs/statuses/58818516685553665 ">
      <from>jpcs (John Snelson)</from>
      <subject>RT @StephenBuxton: Spent last 2 weeks reviewing and rehearsing talks for #MLUC11 (San Francisco April 26-29). Great content - it's going to be a great show!</subject>
      <stamp>15-4-2011 11:06:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/jpcs/statuses/58818417511243776 ">
      <from>jpcs (John Snelson)</from>
      <subject>RT @SCUEngineering: Interested in non-relational database technologies? "MarkLogic InsideHack 2011" (4/28 - FREE, SF) http://mluc11-insidehack.eventbrite.com/</subject>
      <stamp>15-4-2011 11:06:18</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/58810594916171776 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>RT @StephenBuxton: Spent last 2 weeks reviewing and rehearsing talks for #MLUC11 (San Francisco April 26-29). Great content - it's going to be a great show!</subject>
      <stamp>15-4-2011 10:35:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/58734997984657408 ">
      <from>peteaven (peteaven)</from>
      <subject>#MarkLogic User Conference online schedule app http://mluc11.marklogic.com/ built on MLJSON http://bit.ly/i1pMqX #mluc11 -via @hunterhacker</subject>
      <stamp>15-4-2011 5:34:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/katebdl/statuses/58679649571569664 ">
      <from>katebdl (Kate K M L Tun)</from>
      <subject>RT @SCUEngineering: Interested in non-relational database technologies? "MarkLogic InsideHack 2011" (4/28 - FREE, SF) http://mluc11-insidehack.eventbrite.com/</subject>
      <stamp>15-4-2011 1:54:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/jasonmonberg/statuses/58670040517586944 ">
      <from>jasonmonberg (jasonmonberg)</from>
      <subject>RT @StephenBuxton: Spent last 2 weeks reviewing and rehearsing talks for #MLUC11 (San Francisco April 26-29). Great content - it's going to be a great show!</subject>
      <stamp>15-4-2011 1:16:42</stamp>
   </tweet>
   <tweet url="http://twitter.com/jasonmonberg/statuses/58668863868506112 ">
      <from>jasonmonberg (jasonmonberg)</from>
      <subject>RT @SCUEngineering: Interested in non-relational database technologies? "MarkLogic InsideHack 2011" (4/28 - FREE, SF) http://mluc11-insidehack.eventbrite.com/</subject>
      <stamp>15-4-2011 1:12:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/scissorjammer/statuses/58660529312509952 ">
      <from>scissorjammer (alex rock)</from>
      <subject>RT @SCUEngineering: Interested in non-relational database technologies? "MarkLogic InsideHack 2011" (4/28 - FREE, SF) http://mluc11-insidehack.eventbrite.com/</subject>
      <stamp>15-4-2011 0:38:54</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/58655136184139776 ">
      <from>dscape (Nuno Job)</from>
      <subject>RT @SCUEngineering: Interested in non-relational database technologies? "MarkLogic InsideHack 2011" (4/28 - FREE, SF) http://mluc11-insidehack.eventbrite.com/</subject>
      <stamp>15-4-2011 0:17:28</stamp>
   </tweet>
   <tweet url="http://twitter.com/SCUEngineering/statuses/58654150619181056 ">
      <from>SCUEngineering (SCU Engineering)</from>
      <subject>Interested in non-relational database technologies? "MarkLogic InsideHack 2011" (4/28 - FREE, SF) http://mluc11-insidehack.eventbrite.com/</subject>
      <stamp>15-4-2011 0:13:33</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/58585656368168960 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>RT @StephenBuxton: Spent last 2 weeks reviewing and rehearsing talks for #MLUC11 (San Francisco April 26-29). Great content - it's going to be a great show!</subject>
      <stamp>14-4-2011 19:41:23</stamp>
   </tweet>
   <tweet url="http://twitter.com/StephenBuxton/statuses/58585200355049472 ">
      <from>StephenBuxton (stephen buxton)</from>
      <subject>Spent last 2 weeks reviewing and rehearsing talks for #MLUC11 (San Francisco April 26-29). Great content - it's going to be a great show!</subject>
      <stamp>14-4-2011 19:39:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/58557636790067203 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @cdhayes: Checkout the #MarkLogic #MLUC11 app. http://mluc11.marklogic.com/</subject>
      <stamp>14-4-2011 17:50:03</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/58550574706208768 ">
      <from>xquery (james fuller)</from>
      <subject>prepping for #MLUC11 San Francisco public transport pro tips ? ... maps? sites to be seen ?</subject>
      <stamp>14-4-2011 17:21:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/58450011859595264 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>RT @hunterhacker: Coming to MarkLogic's user conf? We have an online schedule app http://mluc11.marklogic.com… (cont) http://deck.ly/~DaXUG</subject>
      <stamp>14-4-2011 10:42:23</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/58910087867138049 ">
      <from>eedeebee (eedeebee)</from>
      <subject>RT @SCUEngineering: Interested in non-relational database technologies? "MarkLogic InsideHack 2011" (4/28 - FREE, SF) http://mluc11-insidehack.eventbrite.com/</subject>
      <stamp>15-4-2011 17:10:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/JustSystems/statuses/58986817076207616 ">
      <from>JustSystems (JustSystems)</from>
      <subject>RT @hunterhacker: Coming to MarkLogic's user conf? We have an online schedule app http://mluc11.marklogic.com/ built on MLJSON http://bit.ly/i1pMqX #mluc11</subject>
      <stamp>15-4-2011 22:15:27</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/58994439732994048 ">
      <from>peteaven (peteaven)</from>
      <subject>new blog post: #FollowAnyDay MLUC11 Developer Lounge &amp; Labs http://bit.ly/gUVWRL</subject>
      <stamp>15-4-2011 22:45:45</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/59005141487058946 ">
      <from>dscape (Nuno Job)</from>
      <subject>RT @peteaven: new blog post: #FollowAnyDay MLUC11 Developer Lounge &amp; Labs http://bit.ly/gUVWRL</subject>
      <stamp>15-4-2011 23:28:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/59006562370453504 ">
      <from>dscape (Nuno Job)</from>
      <subject>Curious about NoSQL Document Databases? Want to learn more? Ask questions to experts that build them? Join us http://bit.ly/nsql-hackers</subject>
      <stamp>15-4-2011 23:33:55</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/59018072933150721 ">
      <from>eedeebee (eedeebee)</from>
      <subject>@peteaven (aka #MarkLogic's Chief Awesome Officer) at work again - http://tinyurl.com/3jnlp5z</subject>
      <stamp>16-4-2011 0:19:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/59046425169895424 ">
      <from>dscape (Nuno Job)</from>
      <subject>NoSQL folks from SFO come learn more about MarkLogic at our Hacker Lounge! http://bit.ly/nsql-hackers</subject>
      <stamp>16-4-2011 2:12:19</stamp>
   </tweet>
   <tweet url="http://twitter.com/johndmitchell/statuses/59107528126103552 ">
      <from>johndmitchell (John D. Mitchell)</from>
      <subject>RT @dscape: Curious about NoSQL Document Databases? Want to learn more? Ask questions to experts that build them? Join us http://bit.ly/nsql-hackers</subject>
      <stamp>16-4-2011 6:15:07</stamp>
   </tweet>
   <tweet url="http://twitter.com/jpcs/statuses/59173101887422464 ">
      <from>jpcs (John Snelson)</from>
      <subject>RT @peteaven: new blog post: #FollowAnyDay MLUC11 Developer Lounge &amp; Labs http://bit.ly/gUVWRL</subject>
      <stamp>16-4-2011 10:35:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/59193877655068672 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>RT @peteaven: new blog post: #FollowAnyDay MLUC11 Developer Lounge &amp; Labs http://bit.ly/gUVWRL</subject>
      <stamp>16-4-2011 11:58:14</stamp>
   </tweet>
   <tweet url="http://twitter.com/glawkatz/statuses/59239509220532224 ">
      <from>glawkatz (Gary L. Katz)</from>
      <subject>RT @eedeebee: @peteaven (aka #MarkLogic's Chief Awesome Officer) at work again - http://tinyurl.com/3jnlp5z</subject>
      <stamp>16-4-2011 14:59:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/dborkar/statuses/59309668278874113 ">
      <from>dborkar (Dipti Borkar)</from>
      <subject>RT @eedeebee: @peteaven (aka #MarkLogic's Chief Awesome Officer) at work again - http://tinyurl.com/3jnlp5z</subject>
      <stamp>16-4-2011 19:38:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/booboojr/statuses/59335926358355968 ">
      <from>booboojr (blossom)</from>
      <subject>thanks  @peteaven  for the s/o and for helping me step up my ML stalker game: http://bit.ly/fYFvpo</subject>
      <stamp>16-4-2011 21:22:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/59903275553660929 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>@ronhitchens drinks are on you at  #mluc11 then</subject>
      <stamp>18-4-2011 10:57:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/jochenjoerg/statuses/59920242293481472 ">
      <from>jochenjoerg (Jochen Jörg)</from>
      <subject>RT @peteaven: new blog post: #FollowAnyDay MLUC11 Developer Lounge &amp; Labs http://bit.ly/gUVWRL</subject>
      <stamp>18-4-2011 12:04:33</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/60000193768210432 ">
      <from>peteaven (peteaven)</from>
      <subject>@mbrevoort thanks.  I wish!  After #MLUC11 i might just do that, til then, #itsonlikedonkeykong</subject>
      <stamp>18-4-2011 17:22:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/60028603299143680 ">
      <from>xquery (james fuller)</from>
      <subject>#MLUC11 related blog post by @peteaven http://bit.ly/dFhnJa</subject>
      <stamp>18-4-2011 19:15:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/JustSystems/statuses/60050112889618432 ">
      <from>JustSystems (JustSystems)</from>
      <subject>RT @peteaven: new blog post: #FollowAnyDay MLUC11 Developer Lounge &amp; Labs http://bit.ly/gUVWRL</subject>
      <stamp>18-4-2011 20:40:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/60075531416248320 ">
      <from>dscape (Nuno Job)</from>
      <subject>Register for InsideHack talk if you are attending. I'll be talking about dinos, jackets, and poetry http://bit.ly/nsql-hackers #nosql #fail</subject>
      <stamp>18-4-2011 22:21:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/60356685809721344 ">
      <from>xquery (james fuller)</from>
      <subject>I will be attending (and presenting) at #MLUC11 San Francisco 25-29 Apr, give me a shout if anyone wants to meet whilst I am in town</subject>
      <stamp>19-4-2011 16:58:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/60376372014620672 ">
      <from>dscape (Nuno Job)</from>
      <subject>RT @peteaven: RT @xquery I will be attending (&amp; presenting) at #MLUC11 San Francisco 25-29 Apr give me a shout if anyone wants to meet whilst I am in town</subject>
      <stamp>19-4-2011 18:17:03</stamp>
   </tweet>
   <tweet url="http://twitter.com/shonbo/statuses/60374733815947264 ">
      <from>shonbo (Mike Hobson)</from>
      <subject>RT @peteaven: RT @xquery I will be attending (&amp; presenting) at #MLUC11 San Francisco 25-29 Apr give me a shout if anyone wants to meet whilst I am in town</subject>
      <stamp>19-4-2011 18:10:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/60374661531303937 ">
      <from>peteaven (peteaven)</from>
      <subject>RT @xquery I will be attending (&amp; presenting) at #MLUC11 San Francisco 25-29 Apr give me a shout if anyone wants to meet whilst I am in town</subject>
      <stamp>19-4-2011 18:10:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/60440480898498560 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>working through a bunch of misc. notes, meetings and emails; trying to get ahead of the week because in San Fran and the #MLUC11 next week</subject>
      <stamp>19-4-2011 22:31:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/iFactoryBoston/statuses/60700653424623616 ">
      <from>iFactoryBoston (iFactory)</from>
      <subject>Getting ready for the @MarkLogic User Conference, next week. Excited to be a sponsor--stop by the iFactory kiosk and say hello! #MLUC11</subject>
      <stamp>20-4-2011 15:45:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/60730998937231360 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>Getting ready for the @MarkLogic User Conference next week. Deciding on sessions to attend - can't be at 2 places at once #MLUC11</subject>
      <stamp>20-4-2011 17:46:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/60756540503760896 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>Only 1 week until the #MarkLogic User Conference! What sessions are you most looking forward to attending? http://bit.ly/dNLwYK  #MLUC11</subject>
      <stamp>20-4-2011 19:27:42</stamp>
   </tweet>
   <tweet url="http://twitter.com/StephenBuxton/statuses/60804098768904192 ">
      <from>StephenBuxton (stephen buxton)</from>
      <subject>Yikes! RT @MarkLogic: Only 1 week til the #MarkLogic User Conference! What .. are you most looking forward to? http://bit.ly/dNLwYK  #MLUC11</subject>
      <stamp>20-4-2011 22:36:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/60797796437078018 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>Getting ready for the MarkLogic user conference next week. #mluc11; sponsoring is a lot of work but hopefully worth it.</subject>
      <stamp>20-4-2011 22:11:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/SalesTactician/statuses/60797794239266816 ">
      <from>SalesTactician (E. Sean Sweeney)</from>
      <subject>Getting ready for the MarkLogic user conference next week. #mluc11; sponsoring is a lot of work but hopefully worth it.</subject>
      <stamp>20-4-2011 22:11:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/jasonmonberg/statuses/60809221263982592 ">
      <from>jasonmonberg (jasonmonberg)</from>
      <subject>RT @StephenBuxton: Yikes! RT @MarkLogic: Only 1 week til the #MarkLogic User Conference! What .. are you most looking forward to? http://bit.ly/dNLwYK  #MLUC11</subject>
      <stamp>20-4-2011 22:57:02</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/60872258243145728 ">
      <from>peteaven (peteaven)</from>
      <subject>RT @MarkLogic: Only 1 week until the #MarkLogic User Conference! What sessions are you most looking forward to attending? http://bit.ly/dNLwYK  #MLUC11</subject>
      <stamp>21-4-2011 3:07:31</stamp>
   </tweet>
   <tweet url="http://twitter.com/garyprusso/statuses/61122947355643904 ">
      <from>garyprusso (garyprusso)</from>
      <subject>Semantic Web Gugu Jim Hendler will discuss Semantic Tuple Storage using #MarkLogic, XQuery, Java, SPARQL. http://tinyurl.com/3suh28z #MLUC11</subject>
      <stamp>21-4-2011 19:43:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/garyprusso/statuses/61123653781303296 ">
      <from>garyprusso (garyprusso)</from>
      <subject>Semantic Web Guru Jim Hendler will discuss Semantic Tuple Storage using #MarkLogic, XQuery, Java, SPARQL. http://tinyurl.com/3suh28z #MLUC11</subject>
      <stamp>21-4-2011 19:46:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/61123426152226816 ">
      <from>eedeebee (eedeebee)</from>
      <subject>RT @StephenBuxton: Yikes! RT @MarkLogic: Only 1 week til the #MarkLogic User Conference! What .. are you most looking forward to? http://bit.ly/dNLwYK  #MLUC11</subject>
      <stamp>21-4-2011 19:45:35</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/61250271329783808 ">
      <from>peteaven (peteaven)</from>
      <subject>RT @garyprusso Semantic Web Guru Jim Hendler on Semantic Tuple Storage using #MarkLogic, XQuery, Java, SPARQL http://bit.ly/gJ26U3 #MLUC11</subject>
      <stamp>22-4-2011 4:09:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/gurusarvothaman/statuses/61253372233256961 ">
      <from>gurusarvothaman (Guru Sarvothaman)</from>
      <subject>#MLUC11 Apr26-29 SFO. @janyainc. Don't miss @dschubmehl led discussion on "Deep Semantic Analysis for Next Generation Content Enrichment.."</subject>
      <stamp>22-4-2011 4:21:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/cognizant/statuses/61393353400528896 ">
      <from>cognizant (Cognizant Tech Sol)</from>
      <subject>Hear Cognizant speak on Delivering Outcome-Based Publishing Solutions 3:45, Apr 27, MarkLogic Users Con http://bit.ly/hQl0aJ #MLUC11</subject>
      <stamp>22-4-2011 13:38:10</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/61432132702175232 ">
      <from>peteaven (peteaven)</from>
      <subject>final push for the user conference next week = starting the morning with a triple latte #MLUC11</subject>
      <stamp>22-4-2011 16:12:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/iFactoryBoston/statuses/61484962750279680 ">
      <from>iFactoryBoston (iFactory)</from>
      <subject>The countdown is on...only 3 days until #MLUC11! Come by the iFactory sponsor kiosk for @pubfactory demos and swag! http://bit.ly/hp5iJ1</subject>
      <stamp>22-4-2011 19:42:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/61481008574369793 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Watched _The Nutty Professor_ (the 1963 version, of course) in preparation for the #MLUC Labs participation http://t.co/hKA8EfA</subject>
      <stamp>22-4-2011 19:26:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/61488819710607360 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @cognizant: Hear Cognizant speak on Delivering Outcome-Based Publishing Solutions 3:45, Apr 27, MarkLogic Users Con http://bit.ly/hQl0aJ #MLUC11</subject>
      <stamp>22-4-2011 19:57:31</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/61527777941266432 ">
      <from>peteaven (peteaven)</from>
      <subject>RT @dscape Less than one week to go to MarkLogic InsideHack, some seats still available /at http://bit.ly/nsql-hackers #nosql #sfo</subject>
      <stamp>22-4-2011 22:32:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/61525946569723904 ">
      <from>dscape (Nuno Job)</from>
      <subject>Less than one week to go to MarkLogic InsideHack, some seats still available /at http://bit.ly/nsql-hackers #nosql #sfo</subject>
      <stamp>22-4-2011 22:25:03</stamp>
   </tweet>
   <tweet url="http://twitter.com/jfix/statuses/61524076568641536 ">
      <from>jfix (Jakob Fix)</from>
      <subject>#mluc11 aaaaargh everybody's tweeting "get ready", but i am not! aaaaargh (just kidding @xquery, everything's gonna go alright) :)</subject>
      <stamp>22-4-2011 22:17:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/61721164367659008 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>At Heathrow ready to depart for SF and #mluc11.</subject>
      <stamp>23-4-2011 11:20:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/jochenjoerg/statuses/61778382945398784 ">
      <from>jochenjoerg (Jochen Jörg)</from>
      <subject>On the way to #sfo to join  #MLUC11. Looking forward to a great event.</subject>
      <stamp>23-4-2011 15:08:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/61785350976184320 ">
      <from>peteaven (peteaven)</from>
      <subject>safe travels! @ronhitchens @jochenjoerg @leepollington see you soon! #MLUC11</subject>
      <stamp>23-4-2011 15:35:50</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/61811433209466881 ">
      <from>eedeebee (eedeebee)</from>
      <subject>Just a few days left before #MarkLogic InsideHack, April 28th 2011 -- http://mluc11-insidehack.eventbrite.com</subject>
      <stamp>23-4-2011 17:19:28</stamp>
   </tweet>
   <tweet url="http://twitter.com/evanlenz/statuses/61836758140203008 ">
      <from>evanlenz (Evan Lenz)</from>
      <subject>RT @eedeebee: Just a few days left before #MarkLogic InsideHack, April 28th 2011 -- http://mluc11-insidehack.eventbrite.com</subject>
      <stamp>23-4-2011 19:00:06</stamp>
   </tweet>
   <tweet url="http://twitter.com/dborkar/statuses/61856039796080640 ">
      <from>dborkar (Dipti Borkar)</from>
      <subject>RT @eedeebee: Just a few days left before #MarkLogic InsideHack, April 28th 2011 -- http://mluc11-insidehack.eventbrite.com</subject>
      <stamp>23-4-2011 20:16:43</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/61869163504865280 ">
      <from>peteaven (peteaven)</from>
      <subject>Forgot to mention: slideTunes: check! ;) #MLUC11</subject>
      <stamp>23-4-2011 21:08:52</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/61868069932367872 ">
      <from>peteaven (peteaven)</from>
      <subject>Word: check!  Excel: check! PowerPoint: check!  Now wondering what I can pull off with Outlook in time for #DemoJam #MLUC11</subject>
      <stamp>23-4-2011 21:04:31</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/61879007603462145 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>iPad2 shipped. Will arrive while I'm away at #MLUC11</subject>
      <stamp>23-4-2011 21:47:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/globalnomad/statuses/61957479428399105 ">
      <from>globalnomad (Global Nomad)</from>
      <subject>Headed to San Francisco tomorrow for a week to speak about @warriorgateway at the #MarkLogic user conference. Can't wait. Miss SF! #MLUC11</subject>
      <stamp>24-4-2011 2:59:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/61979477714014208 ">
      <from>dscape (Nuno Job)</from>
      <subject>If you wanna hear me speak about MarkLogic and why it matters don't forget to register: http://bit.ly/nsql-hackers #nosql #sfo</subject>
      <stamp>24-4-2011 4:27:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/garyprusso/statuses/62256212644872193 ">
      <from>garyprusso (garyprusso)</from>
      <subject>@peteaven Pete - Much thanks for the RT and the reference in your recent blog post. http://tinyurl.com/3jnlp5z</subject>
      <stamp>24-4-2011 22:46:52</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/62254122686087168 ">
      <from>peteaven (peteaven)</from>
      <subject>RT @dscape: If you wanna hear me speak about MarkLogic and why it matters don't forget to register: http://bit.ly/nsql-hackers #nosql #sfo</subject>
      <stamp>24-4-2011 22:38:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/Klortho/statuses/62350366666264576 ">
      <from>Klortho (Chris Maloney)</from>
      <subject>#mluc11  MarkLogic User Conference 2011 - Waaa!  I wanna go! http://icio.us/o8eozn</subject>
      <stamp>25-4-2011 5:01:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/NathanBrothers/statuses/62412107337056256 ">
      <from>NathanBrothers (Nathan Brothers)</from>
      <subject>Packing for a week-long trip to San Francisco to attend #MLUC11.</subject>
      <stamp>25-4-2011 9:06:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/62459323946766336 ">
      <from>peteaven (peteaven)</from>
      <subject>PIT -&gt; SFO #MLUC11</subject>
      <stamp>25-4-2011 12:13:57</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/62464618416713728 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>Flight to lax for a meeting with the omniupdate gang the up to san fran for #mluc11. Back of the plane on american = bad seat</subject>
      <stamp>25-4-2011 12:35:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/jpcs/statuses/62477715500040192 ">
      <from>jpcs (John Snelson)</from>
      <subject>LHR to SFO, see you at #MLUC11</subject>
      <stamp>25-4-2011 13:27:02</stamp>
   </tweet>
   <tweet url="http://twitter.com/cognizant/statuses/62488276686225409 ">
      <from>cognizant (Cognizant Tech Sol)</from>
      <subject>Meet Cognizant at MarkLogic User’s Conference Apr 26-29 #MLUC11 http://bit.ly/hQl0aJ</subject>
      <stamp>25-4-2011 14:09:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/apprelevance/statuses/62503507814653954 ">
      <from>apprelevance (Applied Relevance)</from>
      <subject>Looking forward to seeing old friends and making new ones at #MLUC11.</subject>
      <stamp>25-4-2011 15:09:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/Trifection_00X/statuses/62526093806153728 ">
      <from>Trifection_00X (Gwilym Xalander)</from>
      <subject>RT @cognizant: Meet Cognizant at MarkLogic User’s Conference Apr 26-29 #MLUC11 http://bit.ly/hQl0aJ</subject>
      <stamp>25-4-2011 16:39:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/62535468520194048 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>@ndw SF subways have cool walls too :) http://bit.ly/fX4mYv</subject>
      <stamp>25-4-2011 17:16:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/62539182970642432 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>@ifactoryboston is in route to the #MLUC11, talk to us at our booth and see PubFactory in action</subject>
      <stamp>25-4-2011 17:31:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/62551278844252160 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>@kellblog, going to miss seeing you tomorrow at the #MLUC11. Hope you are well and doing something fun.</subject>
      <stamp>25-4-2011 18:19:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/iFactoryBoston/statuses/62547922155356160 ">
      <from>iFactoryBoston (iFactory)</from>
      <subject>Sean's MLUC-bound! Stop by the iFactory sponsor kiosk for PubFactory demos and more! RT @eseansweeney iFactory is in route to the #MLUC11...</subject>
      <stamp>25-4-2011 18:06:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/crichey/statuses/62546443168268289 ">
      <from>crichey (Clark Richey)</from>
      <subject>Just finished my #activedocument tutorial for #MLUC11</subject>
      <stamp>25-4-2011 18:00:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/62564044061683712 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>#MLUC11 map. Hotel, food, kareoke :) http://bit.ly/gQtzDI</subject>
      <stamp>25-4-2011 19:10:05</stamp>
   </tweet>
   <tweet url="http://twitter.com/cognizant/statuses/62575107176005632 ">
      <from>cognizant (Cognizant Tech Sol)</from>
      <subject>Hear Cognizant speak on Delivering Outcome-Based Publishing Solutions 3:45,  4/27, MarkLogic User’s Con   #MLUC11 http://bit.ly/hQl0aJ</subject>
      <stamp>25-4-2011 19:54:02</stamp>
   </tweet>
   <tweet url="http://twitter.com/starry_sal/statuses/62618105284792320 ">
      <from>starry_sal (Sally Snelson)</from>
      <subject>@jpcs See you when you get back from #MLUC11 :-)</subject>
      <stamp>25-4-2011 22:44:54</stamp>
   </tweet>
   <tweet url="http://twitter.com/glawkatz/statuses/62642963179782145 ">
      <from>glawkatz (Gary L. Katz)</from>
      <subject>Heading to SF for #MLUC11 to discuss #MarkLogic and #semtech #semweb with @jahendler !</subject>
      <stamp>26-4-2011 0:23:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/62642411821735936 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>Coming to this week’s #MarkLogic User Conference? Network with other attendees on LinkedIn! http://linkd.in/he82vA #MLUC11</subject>
      <stamp>26-4-2011 0:21:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/62645709626810368 ">
      <from>peteaven (peteaven)</from>
      <subject>I now have an Outlook Addin w/a web app (served from #MarkLogic)  inserting HTML into email msg body &amp; adding attachments #DemoJam #MLUC11</subject>
      <stamp>26-4-2011 0:34:35</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/62663107830484993 ">
      <from>peteaven (peteaven)</from>
      <subject>where we goin for dinner tonight? #MLUC11</subject>
      <stamp>26-4-2011 1:43:43</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/62678344445067265 ">
      <from>peteaven (peteaven)</from>
      <subject>@jpcs I'm in! #MLUC11 contact info on markspace ;)</subject>
      <stamp>26-4-2011 2:44:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/jpcs/statuses/62675870732664832 ">
      <from>jpcs (John Snelson)</from>
      <subject>So who's near the Palace Hotel and wants to get some food tonight? I'm thinking either Thai or Japanese could be good. #MLUC11</subject>
      <stamp>26-4-2011 2:34:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquerywebappdev/statuses/62755313417330688 ">
      <from>xquerywebappdev (XQuery Web App Dev)</from>
      <subject>Ag, I missed the mluc meetup dinner and Thai was sounding good. I'm in the Palace if anyone wants to meetup tomorrow for bfast\lunch #mluc11</subject>
      <stamp>26-4-2011 7:50:07</stamp>
   </tweet>
   <tweet url="http://twitter.com/cognizant/statuses/62848146480431104 ">
      <from>cognizant (Cognizant Tech Sol)</from>
      <subject>The Future of Content…Today. Hear Cognizant speak on Delivering Outcome-Based Publishing Solutions http://bit.ly/hQl0aJ  #MLUC11</subject>
      <stamp>26-4-2011 13:59:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/62875445422596097 ">
      <from>peteaven (peteaven)</from>
      <subject>#MLUC11 pre-conference training today http://bit.ly/eoUlcH</subject>
      <stamp>26-4-2011 15:47:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/62891937828581377 ">
      <from>peteaven (peteaven)</from>
      <subject>#ruby connector RT @crichey Just finished my #activedocument tutorial for #MLUC11 http://developer.marklogic.com/code/active-document</subject>
      <stamp>26-4-2011 16:53:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/62886592435601408 ">
      <from>peteaven (peteaven)</from>
      <subject>12 hours until #DemoJam #MLUC11</subject>
      <stamp>26-4-2011 16:31:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/62886351804186624 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>We should probably gather and depart for #MLUC11Burrito around 7:30pm, at/near the ML Reception.  At least 2 non #MLUC11 folks are coming.</subject>
      <stamp>26-4-2011 16:30:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/62919899105861632 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>@marklogic #mluc11 Learning  #MarkLogic Office Toolkits with our Chief Awesomeness Officer @peteaven</subject>
      <stamp>26-4-2011 18:44:07</stamp>
   </tweet>
   <tweet url="http://twitter.com/cdhayes/statuses/62913499705245696 ">
      <from>cdhayes (Chet Hayes)</from>
      <subject>Looking forward to a great week at #MLUC11</subject>
      <stamp>26-4-2011 18:18:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/justinknol/statuses/62908812759273472 ">
      <from>justinknol (Justin Knol)</from>
      <subject>I'm about to start on the pre-conference training day at #mluc11</subject>
      <stamp>26-4-2011 18:00:04</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/62908343844478976 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>AA lounge, LAX waiting to go to SFO for the #MLUC11. Looking forward to a great few days.</subject>
      <stamp>26-4-2011 17:58:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/jclip/statuses/62904554160787456 ">
      <from>jclip (James Clippinger)</from>
      <subject>Waiting at #IAD for flight to #MLUC11.  Looking forward to gangland-style sitdown with various #Marklogic crews.</subject>
      <stamp>26-4-2011 17:43:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/JustSystems/statuses/62893803060736000 ">
      <from>JustSystems (JustSystems)</from>
      <subject>JustSystems is exhibiting! Network w/ other attendees on LinkedIn for the #MarkLogic User Conf http://ow.ly/4GLpb #MLUC11 (via @MarkLogic)</subject>
      <stamp>26-4-2011 17:00:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/mich_woodside/statuses/62950091094372352 ">
      <from>mich_woodside (Michelle Woodside)</from>
      <subject>Just about to begin our Partner Day at the MarkLogic User conference in the beautiful Palace Hotel SF!! #MLUC11, #MarkLogic</subject>
      <stamp>26-4-2011 20:44:05</stamp>
   </tweet>
   <tweet url="http://twitter.com/querybuddy/statuses/62945143900225536 ">
      <from>querybuddy (Query Buddy)</from>
      <subject>Sadly I'm not at #MLUC11 this year, but my pal Cody of Catalyst Repository Systems is there! Ask him about the meat department at Safeway.</subject>
      <stamp>26-4-2011 20:24:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/jkgalo/statuses/62953172041351168 ">
      <from>jkgalo (Janet Galope)</from>
      <subject>Wishing all my fellow MarkLogicians a great #MLUC11!!</subject>
      <stamp>26-4-2011 20:56:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/62951602692165632 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>Just got to the Palace Hotel in San Fran, very nice. Partner day starts soon. I need to set up my kiosk. #MLUC11</subject>
      <stamp>26-4-2011 20:50:06</stamp>
   </tweet>
   <tweet url="http://twitter.com/dclaboratory/statuses/62962900247121920 ">
      <from>dclaboratory (Data Conversion Lab)</from>
      <subject>Looking forward to seeing friends old and new at #MLUC11 in San Fran on Wed-Fri.  Please stop by the DCL booth &amp; say hello to Don &amp; David.</subject>
      <stamp>26-4-2011 21:34:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/StephenBuxton/statuses/62962850301349888 ">
      <from>StephenBuxton (stephen buxton)</from>
      <subject>#MLUC11 starts today with training day and a partner day - full conference starts tomorrow. It's going to a great show!</subject>
      <stamp>26-4-2011 21:34:47</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/62971276725202944 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Kicking off #MLUC11 with partner day</subject>
      <stamp>26-4-2011 22:08:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/62979639273984000 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>Just arrived at #MarkLogic #mluc11 user conference. Good showing at the partner sessions.</subject>
      <stamp>26-4-2011 22:41:30</stamp>
   </tweet>
   <tweet url="http://twitter.com/robstoltz/statuses/62981833473794048 ">
      <from>robstoltz (Rob Stoltz)</from>
      <subject>Enjoying Day 1 (Partner Day) of the Marklogic User Conference #MLUC11 Should be a great week!</subject>
      <stamp>26-4-2011 22:50:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/tomstilwell/statuses/62993987434323968 ">
      <from>tomstilwell (Tom Stilwell)</from>
      <subject>Just arrived at the Palace for #MLUC11 !!!</subject>
      <stamp>26-4-2011 23:38:31</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/62990135070965760 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>come check out the @avalonconsult demo at #mluc11 demojam this evening.  Our best demo yet.</subject>
      <stamp>26-4-2011 23:23:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63005386143313920 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Pleased to hear the comments of the new leadership at partner day #MLUC11</subject>
      <stamp>27-4-2011 0:23:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/63012191950995456 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>Listening to Joe Dalton talk at #mluc11 about increasing focus on vertical solutions for customers. Good stuff.</subject>
      <stamp>27-4-2011 0:50:51</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63033726027837440 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>Hey @MarkLogic I'm coming to see you. #MLUC11 (@ San Francisco International Airport (SFO) w/ 67 others) http://4sq.com/h2eB8i</subject>
      <stamp>27-4-2011 2:16:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/mich_woodside/statuses/63038201094352896 ">
      <from>mich_woodside (Michelle Woodside)</from>
      <subject>Avalon sponsored the welcome reception at the MarkLogic User Conference tonight.  Let's mix n' mingle!  @MarkLogic #MLUC11 @Avalonconsult</subject>
      <stamp>27-4-2011 2:34:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63047190737731585 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>Things are about to get started at the #MarkLogic User Conference! Be sure to follow the conference hashtag at #MLUC11</subject>
      <stamp>27-4-2011 3:09:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/shan_shif/statuses/63061604262088705 ">
      <from>shan_shif (Shannon S. Shiflett)</from>
      <subject>RT @MarkLogic: Things are about to get started at the #MarkLogic User Conference! Be sure to follow the conference hashtag at #MLUC11</subject>
      <stamp>27-4-2011 4:07:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63068028031598592 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>We're live from the #MarkLogic User Conference 2011! http://bit.ly/hKVDwI #MLUC11</subject>
      <stamp>27-4-2011 4:32:44</stamp>
   </tweet>
   <tweet url="http://twitter.com/mochasteak/statuses/63072335472758784 ">
      <from>mochasteak (Brian Bishop)</from>
      <subject>Our awesome sr developer Rob Whitby just won the "Most Valuable Community Member" award at #MLUC11. Way to go Rob!</subject>
      <stamp>27-4-2011 4:49:51</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63072220540444672 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>http://newsletter.marklogic.com/2011/04/live-from-mluc11/ Live from the @MarkLogic User Conference #MLUC11</subject>
      <stamp>27-4-2011 4:49:23</stamp>
   </tweet>
   <tweet url="http://twitter.com/guppywon/statuses/63087223775567872 ">
      <from>guppywon (Chris Welch)</from>
      <subject>Shout out to Avalon for very cool concurrent content editing tool. #mluc11</subject>
      <stamp>27-4-2011 5:49:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/63085846403891200 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>Team @iFactoryBoston getting some food #mluc11 http://plixi.com/p/96319957</subject>
      <stamp>27-4-2011 5:43:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63085794583252992 ">
      <from>peteaven (peteaven)</from>
      <subject>Last bullet on slide: "Blossom Coryat Rocks!" #MLUC11 /cc @booboojr</subject>
      <stamp>27-4-2011 5:43:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63085023691157504 ">
      <from>peteaven (peteaven)</from>
      <subject>@booboojr u at #MLUC11 ? U just got a shout out at #DemoJam :)</subject>
      <stamp>27-4-2011 5:40:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/molodyets/statuses/63083015789740032 ">
      <from>molodyets (Harry Bakken)</from>
      <subject>Wish I was at #MLUC11, but somebody's got to write code this week!  ;-)</subject>
      <stamp>27-4-2011 5:32:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/mich_woodside/statuses/63089345405526016 ">
      <from>mich_woodside (Michelle Woodside)</from>
      <subject>Excellent opening night at #mluc11</subject>
      <stamp>27-4-2011 5:57:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/hunterhacker/statuses/63115912445837312 ">
      <from>hunterhacker (Jason Hunter)</from>
      <subject>Enjoyed #MLUC11burrito. Had a quesadilla. #MLUC11</subject>
      <stamp>27-4-2011 7:43:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/mich_woodside/statuses/63110629858357248 ">
      <from>mich_woodside (Michelle Woodside)</from>
      <subject>Congratulations @Avalonconsult for the DemoJam win!!!  #MLUC11</subject>
      <stamp>27-4-2011 7:22:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/mich_woodside/statuses/63109910916902912 ">
      <from>mich_woodside (Michelle Woodside)</from>
      <subject>RT @MarkLogic: We're live from the #MarkLogic User Conference 2011! http://bit.ly/hKVDwI #MLUC11</subject>
      <stamp>27-4-2011 7:19:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63097031769587712 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>at DemoJam QueryConsole produced spontaneous applause for the code profiling feature #MLUC11 #appservices Great preso by Scott Brooks</subject>
      <stamp>27-4-2011 6:27:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63095931981144064 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>“@peteaven: Last bullet on slide: "Blossom Coryat Rocks!" #MLUC11 /cc @booboojr” +1!</subject>
      <stamp>27-4-2011 6:23:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/hiteshc1/statuses/63127569171615745 ">
      <from>hiteshc1 (Hitesh)</from>
      <subject>Here for the #MLUC11 (@ The Palace Hotel) http://4sq.com/gXGK50</subject>
      <stamp>27-4-2011 8:29:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/63132270239821824 ">
      <from>xquery (james fuller)</from>
      <subject>#MLUC11 reception and demo jam was nice ... looking forward to speaking to some of our clients tomorrow and hearing presentations</subject>
      <stamp>27-4-2011 8:48:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/63131513499303936 ">
      <from>dscape (Nuno Job)</from>
      <subject>RT @jpcs: The #MLUC11Burrito crew at #MLUC11  http://t.co/lUvfwC9</subject>
      <stamp>27-4-2011 8:45:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/jpcs/statuses/63130587489255424 ">
      <from>jpcs (John Snelson)</from>
      <subject>The #MLUC11Burrito crew at #MLUC11  http://t.co/lUvfwC9</subject>
      <stamp>27-4-2011 8:41:19</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/63237262737031168 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>Partner day at #mluc11 was great.  Looking forward to todays presentations and speaking with more customers.</subject>
      <stamp>27-4-2011 15:45:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/63232248157179904 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>RT @guppywon: Shout out to Avalon for very cool concurrent content editing tool. #mluc11</subject>
      <stamp>27-4-2011 15:25:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/iFactoryBoston/statuses/63244455758659585 ">
      <from>iFactoryBoston (iFactory)</from>
      <subject>Hello, #MLUC11 conference-goers! Head to the Gold Ballroom @ 11:30am for the iFactory BoF session. Don't miss it!</subject>
      <stamp>27-4-2011 16:13:47</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63240198032601089 ">
      <from>merv (Merv Adrian)</from>
      <subject>Hash tag for MarkLogic user conference is #mluc11. Tweetstream underway</subject>
      <stamp>27-4-2011 15:56:52</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63254248011472896 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>Getting the morning started off right at #MLUC11 at the @VirtusaCorp Breakfast! #MarkLogic http://yfrog.com/gyog4zvuj</subject>
      <stamp>27-4-2011 16:52:42</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63248688625098753 ">
      <from>peteaven (peteaven)</from>
      <subject>Gearin up for the Dev Lounge &amp; Lab today! Join us for a Lab on Word/Excel document generation w/XQuery from 10-11 #MLUC11</subject>
      <stamp>27-4-2011 16:30:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/tstyslin/statuses/63267405786382336 ">
      <from>tstyslin (tim styslinger)</from>
      <subject>#MLUC11</subject>
      <stamp>27-4-2011 17:44:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/ekeating/statuses/63267071248711680 ">
      <from>ekeating (Ed Keating)</from>
      <subject>Here at Marklogic User Conference in San Francisco.  New CEO Ken Bado speaking now #MLUC11 #SIIA</subject>
      <stamp>27-4-2011 17:43:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/63267070015582208 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>#mluc11 Ken Bado presenting.  @MarkLogic can be described in two words.  "It Works"</subject>
      <stamp>27-4-2011 17:43:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/SIIA_Content/statuses/63267068946022400 ">
      <from>SIIA_Content (SIIA Content )</from>
      <subject>Here at Marklogic User Conference in San Francisco.  New CEO Ken Bado speaking now #MLUC11 #SIIA</subject>
      <stamp>27-4-2011 17:43:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/matt_turner_nyc/statuses/63266978248396800 ">
      <from>matt_turner_nyc (matt turner)</from>
      <subject>#MLUC11 is underway with a Demo Jam last night, warm up bike ride with the gang and made it in time for Ken's keynote!</subject>
      <stamp>27-4-2011 17:43:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/sheridap/statuses/63266489020579840 ">
      <from>sheridap (sheridap)</from>
      <subject>sweet! looks liek the MarkLogic user conference app is built with Sencha Touch  #mluc11</subject>
      <stamp>27-4-2011 17:41:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63266419705528321 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @mich_woodside: Hang out with #MarkLogic gurus at the developer labs and lounge - a conference within a conference #mluc11</subject>
      <stamp>27-4-2011 17:41:04</stamp>
   </tweet>
   <tweet url="http://twitter.com/mich_woodside/statuses/63266173927694336 ">
      <from>mich_woodside (Michelle Woodside)</from>
      <subject>Hang out with MarkLogic gurus at the developer labs and lounge - a conference within a conference #mluc11</subject>
      <stamp>27-4-2011 17:40:05</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63265936014196736 ">
      <from>merv (Merv Adrian)</from>
      <subject>#mluc11 Standing room around walls running out - room is packed. Lots of busy thumbs in evidence.</subject>
      <stamp>27-4-2011 17:39:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/63265758385422338 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>Tracy Eiler kicking of #mluc11.  @globalnomad presenting on Warrior Gateway twice during the sessions.</subject>
      <stamp>27-4-2011 17:38:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63265551597830144 ">
      <from>merv (Merv Adrian)</from>
      <subject>#mluc11 partners include SIs, taxonomy builders, consultants, and of course publishing products of various kinds</subject>
      <stamp>27-4-2011 17:37:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63265313650769921 ">
      <from>merv (Merv Adrian)</from>
      <subject>#mluc11 partner room shows a growing awareness that MarkLogic will be a platform. Ken Bado, new CEO, has oppty to reposition beyond vertical</subject>
      <stamp>27-4-2011 17:36:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/mich_woodside/statuses/63264233953046528 ">
      <from>mich_woodside (Michelle Woodside)</from>
      <subject>Tracy Eiler opens the general session at #mluc11</subject>
      <stamp>27-4-2011 17:32:23</stamp>
   </tweet>
   <tweet url="http://twitter.com/jblossom/statuses/63264141460242432 ">
      <from>jblossom (John Blossom)</from>
      <subject>At the Mark Logic User Conference in San Francisco, follow conference tweets via #mluc11. Great crowd, great programme</subject>
      <stamp>27-4-2011 17:32:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/shonbo/statuses/63263465598492673 ">
      <from>shonbo (Mike Hobson)</from>
      <subject>RT @peteaven: Gearin up for the Dev Lounge &amp; Lab today! Join us for a Lab on Word/Excel document generation w/XQuery from 10-11 #MLUC11</subject>
      <stamp>27-4-2011 17:29:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/chris_biow/statuses/63274904795099136 ">
      <from>chris_biow (Christopher Biow)</from>
      <subject>#MLUC11 Tony Tran, VP Technology, Economist Intelligence Unit: MarkLogic exceeded Search rqmnts and goes beyond, providing intel capability.</subject>
      <stamp>27-4-2011 18:14:47</stamp>
   </tweet>
   <tweet url="http://twitter.com/marksmithvr/statuses/63274901431263232 ">
      <from>marksmithvr (Mark Smith)</from>
      <subject>MarkLogic definitely has strength in publishing &amp; information access industry, &amp; government industries #mluc11</subject>
      <stamp>27-4-2011 18:14:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/jblossom/statuses/63274901326409728 ">
      <from>jblossom (John Blossom)</from>
      <subject>#tech Mark Logic User Conference Kickoff http://j.mp/gMJHMm CEO Ken Bado kicks off #mluc11</subject>
      <stamp>27-4-2011 18:14:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/ContentNation/statuses/63274901309632512 ">
      <from>ContentNation (Content Nation)</from>
      <subject>#tech Mark Logic User Conference Kickoff http://j.mp/gMJHMm CEO Ken Bado kicks off #mluc11</subject>
      <stamp>27-4-2011 18:14:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63274879570550784 ">
      <from>merv (Merv Adrian)</from>
      <subject>#mluc11 good to see @marksmithvr here. And was able to save him a seat</subject>
      <stamp>27-4-2011 18:14:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/kurt_cagle/statuses/63274658715271168 ">
      <from>kurt_cagle (Kurt Cagle)</from>
      <subject>#mluc11 Tony Tran: Happy to see new focus on developers network .. thinks its critical for their success.</subject>
      <stamp>27-4-2011 18:13:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/mstrohlein/statuses/63274587848314880 ">
      <from>mstrohlein (Marc Strohlein)</from>
      <subject>RT @ekeating: CEO Ken Bado predicts Marklogic  will grow to half a Billion $ in 5 yrs via global growth, dev community &amp;  students #MLUC11</subject>
      <stamp>27-4-2011 18:13:31</stamp>
   </tweet>
   <tweet url="http://twitter.com/mstrohlein/statuses/63274529459408896 ">
      <from>mstrohlein (Marc Strohlein)</from>
      <subject>RT @ekeating: RT @jhilgerbc: #mluc11 Ken Bado says that 80% of information is unstructured. Only 3 in 20 appli… (cont) http://deck.ly/~rXHwk</subject>
      <stamp>27-4-2011 18:13:18</stamp>
   </tweet>
   <tweet url="http://twitter.com/marksmithvr/statuses/63274526095589376 ">
      <from>marksmithvr (Mark Smith)</from>
      <subject>RT @merv: #mluc11 new CEO Ken Bado was at AutoDesk for 8 yrs– as it grew from $800M to $2B. Joined "because it's industry leader in unstrcutured info"</subject>
      <stamp>27-4-2011 18:13:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/squeezedtim/statuses/63274514762579969 ">
      <from>squeezedtim (Tim Babbitt)</from>
      <subject>RT @jclip: Adriaan Bouten, McGraw-Hill: #Marklogic enables agility which reduces risk #MLUC11</subject>
      <stamp>27-4-2011 18:13:14</stamp>
   </tweet>
   <tweet url="http://twitter.com/guppywon/statuses/63274474983792640 ">
      <from>guppywon (Chris Welch)</from>
      <subject>#mluc11 #MarkLogic helps The Economist package data &amp; content and deliver it to tablet-based analytics applications.</subject>
      <stamp>27-4-2011 18:13:05</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63274441341276162 ">
      <from>merv (Merv Adrian)</from>
      <subject>#mluc11 Economist sees a key advantage for emerging project opportunities - "we can do these much more quickly with MarkLogic."</subject>
      <stamp>27-4-2011 18:12:57</stamp>
   </tweet>
   <tweet url="http://twitter.com/kurt_cagle/statuses/63274373389352960 ">
      <from>kurt_cagle (Kurt Cagle)</from>
      <subject>#mluc11 Tony Tran: Many clients are also looking (heavily) for mobile feeds and apps.</subject>
      <stamp>27-4-2011 18:12:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/63274329584041984 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>#mluc11 Economist is using #marklogic to package targeted content to meet specific customer requests.  Sounds like custom publishing to me.</subject>
      <stamp>27-4-2011 18:12:30</stamp>
   </tweet>
   <tweet url="http://twitter.com/marksmithvr/statuses/63274310013435905 ">
      <from>marksmithvr (Mark Smith)</from>
      <subject>RT @ekeating: CEO Ken Bado predicts Marklogic  will grow to half a Billion $ in 5 yrs via global growth, dev community &amp;  students #MLUC11</subject>
      <stamp>27-4-2011 18:12:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63282651032862721 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>RT @jpcs: CEO keynote by Ken Bado. #MarkLogic a half billion company in 5 years. #MLUC11</subject>
      <stamp>27-4-2011 18:45:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63282619156140032 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @MarkLogic: "80% of information is unstructured, yet only 3 out of 20 applications can leverage it" CEO Bado on stage #MLUC11</subject>
      <stamp>27-4-2011 18:45:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63282573677309952 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @jpcs: Andy Walker, CEO of 426 solutions. There's amazing value in unstructured data - most people ignore because it's too difficult. #MLUC11</subject>
      <stamp>27-4-2011 18:45:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/kurt_cagle/statuses/63282414088232960 ">
      <from>kurt_cagle (Kurt Cagle)</from>
      <subject>#mluc11 Coolest demo jam from last night - EVN's MarkLogic connector for Drupal - use ML as your Drupal database. Hoping to get more info.</subject>
      <stamp>27-4-2011 18:44:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/SethGrimes/statuses/63282092305424384 ">
      <from>SethGrimes (Seth Grimes)</from>
      <subject>Bet Autodesk isn't one :: RT @MarkLogic "80% of info is unstructured, yet only 3 out of 20 applications can leverage it" CEO Bado #MLUC11</subject>
      <stamp>27-4-2011 18:43:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/SethGrimes/statuses/63281573277073408 ">
      <from>SethGrimes (Seth Grimes)</from>
      <subject>RT @MarkLogic: "80% of information is unstructured, yet only 3 out of 20 applications can leverage it" CEO Bado on stage #MLUC11</subject>
      <stamp>27-4-2011 18:41:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/kurt_cagle/statuses/63281352560230400 ">
      <from>kurt_cagle (Kurt Cagle)</from>
      <subject>#mluc11 #SemTech Get 15% off SemTech conference (June 5-9) using my speaker code SPK15.</subject>
      <stamp>27-4-2011 18:40:24</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63281261204078592 ">
      <from>merv (Merv Adrian)</from>
      <subject>RT @guppywon: #Mluc11 #MarkLogic powers over $2 billion in annual product revenue and over 200 information applications - Ken Bado</subject>
      <stamp>27-4-2011 18:40:03</stamp>
   </tweet>
   <tweet url="http://twitter.com/shonbo/statuses/63281242711392256 ">
      <from>shonbo (Mike Hobson)</from>
      <subject>RT @MarkLogic: Tony Tran VP #theeconomist Intelligence Unit "what really differentiated MarkLogic was the potential beyond search for the future" #MLUC11</subject>
      <stamp>27-4-2011 18:39:58</stamp>
   </tweet>
   <tweet url="http://twitter.com/shonbo/statuses/63280893648846848 ">
      <from>shonbo (Mike Hobson)</from>
      <subject>RT @jblossom: Powerful examples of Big Data at #mluc11 so far</subject>
      <stamp>27-4-2011 18:38:35</stamp>
   </tweet>
   <tweet url="http://twitter.com/shonbo/statuses/63280649699725313 ">
      <from>shonbo (Mike Hobson)</from>
      <subject>RT @jblossom: #tech 426 Solutions using Mark Logic in Transportation Threat Analysis http://j.mp/kanV5S #mluc11 spooky, but powerful</subject>
      <stamp>27-4-2011 18:37:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/kurt_cagle/statuses/63280443927166976 ">
      <from>kurt_cagle (Kurt Cagle)</from>
      <subject>I'm doing a Birds of a Feather talk on the Semantic Web at the MarkLogic Users Conference #mluc11 http://www.marklogicevents.com/</subject>
      <stamp>27-4-2011 18:36:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/kurt_cagle/statuses/63280162921398272 ">
      <from>kurt_cagle (Kurt Cagle)</from>
      <subject>#mluc11 ML needs to build an app generator - something that will create Android/iPhone data apps directly from ML. Huge market potential.</subject>
      <stamp>27-4-2011 18:35:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/jblossom/statuses/63279264878956544 ">
      <from>jblossom (John Blossom)</from>
      <subject>#tech 426 Solutions using Mark Logic in Transportation Threat Analysis http://j.mp/kanV5S #mluc11 spooky, but powerful</subject>
      <stamp>27-4-2011 18:32:07</stamp>
   </tweet>
   <tweet url="http://twitter.com/ContentNation/statuses/63279264807657472 ">
      <from>ContentNation (Content Nation)</from>
      <subject>#tech 426 Solutions using Mark Logic in Transportation Threat Analysis http://j.mp/kanV5S #mluc11 spooky, but powerful</subject>
      <stamp>27-4-2011 18:32:07</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63289972500869120 ">
      <from>peteaven (peteaven)</from>
      <subject>Dev Lounge &amp; Lab at #MLUC11 http://twitpic.com/4q77ya</subject>
      <stamp>27-4-2011 19:14:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63288750138073088 ">
      <from>peteaven (peteaven)</from>
      <subject>Dr. Paul Rooney talks performance in Dev Lounge #MLUC11 http://twitpic.com/4q765i</subject>
      <stamp>27-4-2011 19:09:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/cognizant/statuses/63286718408822784 ">
      <from>cognizant (Cognizant Tech Sol)</from>
      <subject>Meet us at Kiosk 3 at MarkLogic User’s Conference #MLUC11 http://bit.ly/hQl0aJ</subject>
      <stamp>27-4-2011 19:01:44</stamp>
   </tweet>
   <tweet url="http://twitter.com/ddelmoli/statuses/63284937977114624 ">
      <from>ddelmoli (Dominic Delmolino)</from>
      <subject>Do folks consider XML documents to be unstructured? #mluc11</subject>
      <stamp>27-4-2011 18:54:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63284533876891648 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>I heard that the #Semantic technology session with Jim Hendler will have some cool things to see.... #MLUC11</subject>
      <stamp>27-4-2011 18:53:03</stamp>
   </tweet>
   <tweet url="http://twitter.com/garyprusso/statuses/63284123892060160 ">
      <from>garyprusso (garyprusso)</from>
      <subject>RT @guppywon: #mluc11 Tony Tran, VP Tech, of Economist Intelligence Unit talking about their use of #MarkLogic to help users discover economic research.</subject>
      <stamp>27-4-2011 18:51:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/garyprusso/statuses/63283713424900096 ">
      <from>garyprusso (garyprusso)</from>
      <subject>RT @MarkLogic: Tony Tran VP #theeconomist Intelligence Unit "what really differentiated MarkLogic was the potential beyond search for the future" #MLUC11</subject>
      <stamp>27-4-2011 18:49:47</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63297894123450368 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#mluc11 Enabling effective search for mobile - search goes beyond just relevance. Facets are now #1 innovation for improving search</subject>
      <stamp>27-4-2011 19:46:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63297855758139392 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Link to faceted navigation article from Sam Mefford's mobile talk: http://t.co/H1s70Up #MLUC11</subject>
      <stamp>27-4-2011 19:45:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63297850888560640 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Facets are great, but summarizing results (eg counts per facet) just as important. #mluc11</subject>
      <stamp>27-4-2011 19:45:58</stamp>
   </tweet>
   <tweet url="http://twitter.com/JustSystems/statuses/63297561615810560 ">
      <from>JustSystems (JustSystems)</from>
      <subject>Can't make it to the #MarkLogic User Conference? Follow the action (via the #mluc11 hashtag) #techcomm #publishing #xml</subject>
      <stamp>27-4-2011 19:44:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattioV/statuses/63297445530050563 ">
      <from>MattioV (Mattio Valentino)</from>
      <subject>If you need a little freelance help (5-8 hrs/wk) ping me and let's see if we can work together. #MLUC11</subject>
      <stamp>27-4-2011 19:44:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/marksmithvr/statuses/63297326717997057 ">
      <from>marksmithvr (Mark Smith)</from>
      <subject>RT @lisabos: Watching Avalon talk about mobile search #mluc11</subject>
      <stamp>27-4-2011 19:43:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/63297322154598400 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>OUP's African American Studies - an iFactory product, goes up on the screen at #mluc11. The iFactory kiosk is outside.</subject>
      <stamp>27-4-2011 19:43:52</stamp>
   </tweet>
   <tweet url="http://twitter.com/sheridap/statuses/63297248280313856 ">
      <from>sheridap (sheridap)</from>
      <subject>Faceted search works if you have metadata that *matters* #mluc11</subject>
      <stamp>27-4-2011 19:43:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63297016918310912 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#mluc11 Enabling effective search for mobile - Who deserves the power? Users</subject>
      <stamp>27-4-2011 19:42:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63296938656792576 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Search on mobile matters more than search on the desktop. -Sam Mefford #MLUC11</subject>
      <stamp>27-4-2011 19:42:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63296762357620736 ">
      <from>peteaven (peteaven)</from>
      <subject>dev lounge &amp; lab pocket protector FTW #MLUC11 http://twitpic.com/4q7hwj</subject>
      <stamp>27-4-2011 19:41:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/glawkatz/statuses/63296724734717953 ">
      <from>glawkatz (Gary L. Katz)</from>
      <subject>RT @kurt_cagle: I'm doing a Birds of a Feather talk on the Semantic Web at the MarkLogic Users Conference #mluc11 http://www.marklogicevents.com/</subject>
      <stamp>27-4-2011 19:41:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/jclip/statuses/63296666274508800 ">
      <from>jclip (James Clippinger)</from>
      <subject>Learning from Matt Carroll of 42Six about using #MarkLogic to stop "nefarious activity" #MLUC11</subject>
      <stamp>27-4-2011 19:41:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/collwhit/statuses/63296555175772160 ">
      <from>collwhit (Colleen Whitney)</from>
      <subject>RT @mdubinko: by 2014, more internet access via mobile vs wired access. #MLUC11 (More mobile users in China now than total people in USA)</subject>
      <stamp>27-4-2011 19:40:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/dclaboratory/statuses/63296473734987776 ">
      <from>dclaboratory (Data Conversion Lab)</from>
      <subject>How does US DOT manage all the intelligence they collect? Learning at #MLUC11</subject>
      <stamp>27-4-2011 19:40:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63305446647283712 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Props to Colleen Whitney for the outstanding search:suggest() implementation. #MLUC11</subject>
      <stamp>27-4-2011 20:16:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/decisionstats/statuses/63305154182660096 ">
      <from>decisionstats (Ajay Ohri)</from>
      <subject>RT @merv: #mluc11 "Lazy delete" marks old record, then new record is added at end. Periodic merge process results in wipe of deleted records.</subject>
      <stamp>27-4-2011 20:14:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63305102760480768 ">
      <from>merv (Merv Adrian)</from>
      <subject>#mluc11 "Lazy delete" marks old record, then new record is added at end. Periodic merge process results in wipe of deleted records.</subject>
      <stamp>27-4-2011 20:14:47</stamp>
   </tweet>
   <tweet url="http://twitter.com/NathanBrothers/statuses/63305026252193793 ">
      <from>NathanBrothers (Nathan Brothers)</from>
      <subject>#mluc11 Can someone post a link to Sam from Avalon's blog?</subject>
      <stamp>27-4-2011 20:14:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63304818525093890 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @mdubinko: "Getting your content mobile is as important as getting it on the web was ten years ago." -Sam Mefford #MLUC11</subject>
      <stamp>27-4-2011 20:13:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63304786950365185 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>"Don't auto-complete on the first three characters" is a compromise. Often it can be helpful. -Sam Mefford #MLUC11</subject>
      <stamp>27-4-2011 20:13:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63304729068974080 ">
      <from>merv (Merv Adrian)</from>
      <subject>#mluc11 MarkLogic's implementation of MVCC facilitates performance. Adds take place in memory and are written to disk periodically.</subject>
      <stamp>27-4-2011 20:13:18</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63304486151667712 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>#MLUC11 breakout: "what makes MarkLogic special: universal #index, shared-nothing #cluster, multi-version concurrency control"</subject>
      <stamp>27-4-2011 20:12:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/NathanBrothers/statuses/63304018075717633 ">
      <from>NathanBrothers (Nathan Brothers)</from>
      <subject>#mluc11 Implementing hybrid auto complete in a mobile environment (client side and server side) can provide fast results and flexibility.</subject>
      <stamp>27-4-2011 20:10:28</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63303519809191936 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>RT @mdubinko: Link to faceted navigation article from Sam Mefford's mobile talk: http://t.co/H1s70Up #MLUC11</subject>
      <stamp>27-4-2011 20:08:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63303334576144384 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @mdubinko: "Getting your content mobile is as important as getting it on the web was ten years ago." -Sam Mefford #MLUC11</subject>
      <stamp>27-4-2011 20:07:45</stamp>
   </tweet>
   <tweet url="http://twitter.com/merv/statuses/63302892324532224 ">
      <from>merv (Merv Adrian)</from>
      <subject>#mluc11 Universal Index – inverted list model - gets its own talk later here. Too bad I have to miss...</subject>
      <stamp>27-4-2011 20:06:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/Luigeee/statuses/63302869545263104 ">
      <from>Luigeee (Luigi)</from>
      <subject>RT @Grtjn: RT @mdubinko: Link to faceted navigation article from Sam Mefford's mobile talk: http://t.co/H1s70Up #MLUC11</subject>
      <stamp>27-4-2011 20:05:54</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63302690477850625 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>Stephen Buxton talking about #MarkLogic zooming in on its universal index #MLUC11</subject>
      <stamp>27-4-2011 20:05:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63302590154289152 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#mluc11 Enabling effective search for mobile - getting your content mobile is as important as it was getting it on the web 10+ yrs ago</subject>
      <stamp>27-4-2011 20:04:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/gandalf_grey/statuses/63312950747856896 ">
      <from>gandalf_grey (Stephen K. Anthony)</from>
      <subject>RT @mdubinko: "Getting your content mobile is as important as getting it on the web was ten years ago." -Sam Mefford #MLUC11</subject>
      <stamp>27-4-2011 20:45:58</stamp>
   </tweet>
   <tweet url="http://twitter.com/rgoldthwaite/statuses/63312311443668992 ">
      <from>rgoldthwaite (Rebecca Goldthwaite)</from>
      <subject>RT @mdubinko: "Getting your content mobile is as important as getting it on the web was ten years ago." -Sam Mefford #MLUC11</subject>
      <stamp>27-4-2011 20:43:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/dransfim/statuses/63308774315790336 ">
      <from>dransfim (martin dransfield)</from>
      <subject>Beverly Jamison's presentation on citation mining, leads me to believe my ideas are worth pursuing. #mluc11</subject>
      <stamp>27-4-2011 20:29:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/eciblue/statuses/63308735149383680 ">
      <from>eciblue (dj maclin)</from>
      <subject>RT @peteaven: dev lounge &amp; lab pocket protector FTW #MLUC11 http://twitpic.com/4q7hwj</subject>
      <stamp>27-4-2011 20:29:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/squeezedtim/statuses/63307963569410048 ">
      <from>squeezedtim (Tim Babbitt)</from>
      <subject>#MLUC11 great presentation by APAs Beverly Jamison on a capability to get value out of cited references using MarkLogic and RefExpress.</subject>
      <stamp>27-4-2011 20:26:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/jasonbaldridge/statuses/63307764436434946 ">
      <from>jasonbaldridge (Jason Baldridge)</from>
      <subject>RT @MarkLogic: "80% of information is unstructured, yet only 3 out of 20 applications can leverage it" CEO Bado on stage #MLUC11</subject>
      <stamp>27-4-2011 20:25:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/justinknol/statuses/63307241499013120 ">
      <from>justinknol (Justin Knol)</from>
      <subject>RT @mdubinko: "Getting your content mobile is as important as getting it on the web was ten years ago." -Sam Mefford #MLUC11</subject>
      <stamp>27-4-2011 20:23:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63306979187245056 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>The Firefox "awesome bar" is a great example of auto-complete UX. #MLUC11</subject>
      <stamp>27-4-2011 20:22:14</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63306960606470144 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @mdubinko: "Don't auto-complete on the first three characters" is a compromise. Often it can be helpful. -Sam Mefford #MLUC11</subject>
      <stamp>27-4-2011 20:22:10</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63306941451091969 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @MarkLogic: #MLUC11 breakout: "what makes MarkLogic special: universal #index, shared-nothing #cluster, multi-version concurrency control"</subject>
      <stamp>27-4-2011 20:22:05</stamp>
   </tweet>
   <tweet url="http://twitter.com/sheridap/statuses/63306888720302082 ">
      <from>sheridap (sheridap)</from>
      <subject>Reward search and browse time spent by allowing users to Save and create push feeds #mluc11 #mobilecontent #ux</subject>
      <stamp>27-4-2011 20:21:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/SethGrimes/statuses/63305919349530625 ">
      <from>SethGrimes (Seth Grimes)</from>
      <subject>@merv That's the old DBMS versioning architecture that InterBase (later Firebird) had in the mid-'90s. #mluc11</subject>
      <stamp>27-4-2011 20:18:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/jillmwo/statuses/63305819252469760 ">
      <from>jillmwo (Jill ONeill)</from>
      <subject>RT @mdubinko: "Getting your content mobile is as important as getting it on the web was ten years ago." -Sam Mefford #MLUC11</subject>
      <stamp>27-4-2011 20:17:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/63494302214533120 ">
      <from>dscape (Nuno Job)</from>
      <subject>Kudos @jpcs RT @john_craft John Snelson's talk on transactions was fantastic. He knows his stuff #mluc11</subject>
      <stamp>28-4-2011 8:46:35</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/63489442840711168 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>Totally knackered from a long day at #mluc11 Today has been a good, good day.  Sleep.  Rinse.  Repeat.</subject>
      <stamp>28-4-2011 8:27:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/63486346160910336 ">
      <from>eedeebee (eedeebee)</from>
      <subject>RT @mdubinko: I have grown attached to my nerdcore MarkLogic lab coat. #MLUC11</subject>
      <stamp>28-4-2011 8:14:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/63483873920692224 ">
      <from>eedeebee (eedeebee)</from>
      <subject>NOTE: Thurs AM Dev Labs will be in Twin Peaks North (at end of sunset court) #MLUC11 #weneedextraspace</subject>
      <stamp>28-4-2011 8:05:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/shonbo/statuses/63483173429981184 ">
      <from>shonbo (Mike Hobson)</from>
      <subject>RT @xquerywebappdev: I've been impressed with the MarkLogic user community. There's a lot of talent and people are nice and easy to talk to. #mluc11</subject>
      <stamp>28-4-2011 8:02:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/shonbo/statuses/63482447769243648 ">
      <from>shonbo (Mike Hobson)</from>
      <subject>RT @MarkLogic: Can't make it to our user conference? We're thinking about you - watch a snippet from the opening keynote here http://bit.ly/mSQ7n8 #mluc11</subject>
      <stamp>28-4-2011 7:59:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/63477712936894464 ">
      <from>dscape (Nuno Job)</from>
      <subject>Friends: feel free to drop by the Palace SFO tomorrow (2nd floor@devlounge) 1:45PM to talk about MarkLogic. http://bit.ly/dev-lounge</subject>
      <stamp>28-4-2011 7:40:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/johndmitchell/statuses/63459615064588289 ">
      <from>johndmitchell (John D. Mitchell)</from>
      <subject>:-) RT @hunterhacker (smile) @mdubinko: If anyone hasn't checked out MarkMail yet, you should... http://t.co/9lpmGdZ #MLUC11</subject>
      <stamp>28-4-2011 6:28:45</stamp>
   </tweet>
   <tweet url="http://twitter.com/prooney625/statuses/63456650803167233 ">
      <from>prooney625 (Paul Rooney)</from>
      <subject>RT @peteaven: Dr. Paul Rooney talks performance in Dev Lounge #MLUC11 http://twitpic.com/4q765i</subject>
      <stamp>28-4-2011 6:16:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/63454770924486657 ">
      <from>dscape (Nuno Job)</from>
      <subject>@jchris @janl @mikeal can't make it still in #mluc11. You are welcome to come by tomorrow if you like. Or let me know if u meet up again :)</subject>
      <stamp>28-4-2011 6:09:30</stamp>
   </tweet>
   <tweet url="http://twitter.com/mariannemyers/statuses/63449525477588992 ">
      <from>mariannemyers (Marianne Myers)</from>
      <subject>RT @xquerywebappdev: I've been impressed with the MarkLogic user community. There's a lot of talent and people are nice and easy to talk to. #mluc11</subject>
      <stamp>28-4-2011 5:48:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquerywebappdev/statuses/63447847944728576 ">
      <from>xquerywebappdev (XQuery Web App Dev)</from>
      <subject>I've been impressed with the MarkLogic user community. There's a lot of talent and people are nice and easy to talk to. #mluc11</subject>
      <stamp>28-4-2011 5:42:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/63431085261979648 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>Great day at #mluc11, lots of great sessions and meetings. Now team @iFactoryBoston is off to dinner with our friend from De Gruyter.</subject>
      <stamp>28-4-2011 4:35:23</stamp>
   </tweet>
   <tweet url="http://twitter.com/nyike/statuses/63424413567168512 ">
      <from>nyike (Isaac Sacolick)</from>
      <subject>RT @jasonmonberg: "Can I plug MarkLogic into your brain?" Devin Holmes, Warrior Gateway #MLUC11</subject>
      <stamp>28-4-2011 4:08:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/notessensei/statuses/63415476981735424 ">
      <from>notessensei (Stephan H. Wissel)</from>
      <subject>RT @mdubinko: OH: "Everyone who makes a global statement is an idiot" #MLUC11</subject>
      <stamp>28-4-2011 3:33:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63628105490776064 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>"If you have creative ideas, you then have to find how to implement them. If you want to win you have to do both." Pr. Robert Sutton #MLUC11</subject>
      <stamp>28-4-2011 17:38:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63627837982248960 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Creativity + Implementation = Innovation #MLUC11 #onetwopunch</subject>
      <stamp>28-4-2011 17:37:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/andrewbrenneman/statuses/63627649045643265 ">
      <from>andrewbrenneman (Andrew Brenneman)</from>
      <subject>Participating in MarkLogic User Conference #MLUC11</subject>
      <stamp>28-4-2011 17:36:28</stamp>
   </tweet>
   <tweet url="http://twitter.com/mich_woodside/statuses/63627627595960320 ">
      <from>mich_woodside (Michelle Woodside)</from>
      <subject>RT @MarkLogic: How to feed creativity in teams in risk adverse environment? Bob Sutton is addressing right now at #mluc11</subject>
      <stamp>28-4-2011 17:36:23</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63627485371314176 ">
      <from>peteaven (peteaven)</from>
      <subject>Robert Sutton keynote starts now to set of day 2 #MLUC11</subject>
      <stamp>28-4-2011 17:35:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/shonbo/statuses/63627464554979328 ">
      <from>shonbo (Mike Hobson)</from>
      <subject>RT @MarkLogic: How to feed creativity in teams in risk adverse environment? Bob Sutton is addressing right now at #mluc11</subject>
      <stamp>28-4-2011 17:35:44</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63627394916945920 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>How to feed creativity in teams in risk adverse environment? Bob Sutton is addressing right now at #mluc11</subject>
      <stamp>28-4-2011 17:35:27</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63627208941514752 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>"A Great Leader Isn't Enough: What Innovative Teams Do" Robert Sutton, Stanford University #MLUC11</subject>
      <stamp>28-4-2011 17:34:43</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63625850729402369 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>3 minutes until we start day 2 of #mluc11 with prof. and best-selling author Robert Sutton!</subject>
      <stamp>28-4-2011 17:29:19</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63625625029718016 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Growing crowd of people happily chatting in the Grand Ballroom, waiting for  the 8:30 keynote from Robert Sutton. #MLUC11</subject>
      <stamp>28-4-2011 17:28:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63624048436981761 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @eedeebee: NOTE: Thurs AM Dev Labs will be in Twin Peaks North (at end of sunset court) #MLUC11 #weneedextraspace</subject>
      <stamp>28-4-2011 17:22:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/dclaboratory/statuses/63620874707795969 ">
      <from>dclaboratory (Data Conversion Lab)</from>
      <subject>A beautiful morning in San Francisco for day 2 of #MLUC11</subject>
      <stamp>28-4-2011 17:09:33</stamp>
   </tweet>
   <tweet url="http://twitter.com/guppywon/statuses/63635702159642624 ">
      <from>guppywon (Chris Welch)</from>
      <subject>RT @MattLyles: #MLUC11 "When 2 people in business always agree, 1 of them is unnecessary" - William Wrigley Jr.</subject>
      <stamp>28-4-2011 18:08:28</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63635599592140801 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @lisabos: Successful creative groups know how to fight - fight as if they're right and listen as if they're wrong. #mluc11</subject>
      <stamp>28-4-2011 18:08:03</stamp>
   </tweet>
   <tweet url="http://twitter.com/kev_burns/statuses/63635587307028480 ">
      <from>kev_burns (Kevin Burns)</from>
      <subject>RT @mdubinko: Innovation happens when people respect each other--but fight like crazy over ideas. -Bob Suttion #MLUC11</subject>
      <stamp>28-4-2011 18:08:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/63635570483658752 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>Listen like you're wrong #mluc11</subject>
      <stamp>28-4-2011 18:07:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63635525738831872 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#MLUC11 "When 2 people in business always agree, 1 of them is unnecessary" - William Wrigley Jr.</subject>
      <stamp>28-4-2011 18:07:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/JustSystems/statuses/63635457396842496 ">
      <from>JustSystems (JustSystems)</from>
      <subject>RT @MarkLogic: Can't make it to our user conference? We're thinking about you - watch a snippet from the opening keynote here http://bit.ly/mSQ7n8 #mluc11</subject>
      <stamp>28-4-2011 18:07:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63635456427958272 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Successful creative groups know how to fight - fight as if they're right and listen as if they're wrong. #mluc11</subject>
      <stamp>28-4-2011 18:07:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/63635421699117056 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>Innovation happens when people respect each other but fight like crazy over ideas #mluc11</subject>
      <stamp>28-4-2011 18:07:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63635381870010368 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Strong opinions, weakly held. Fight like you're right; listen like you're wrong. #MLUC11</subject>
      <stamp>28-4-2011 18:07:11</stamp>
   </tweet>
   <tweet url="http://twitter.com/justinknol/statuses/63635380955643905 ">
      <from>justinknol (Justin Knol)</from>
      <subject>RT @MarkLogic: "Where is your place for failing? You cant fail everywhere but you must have room for iterations" Pr. Sutton #MLUC11</subject>
      <stamp>28-4-2011 18:07:11</stamp>
   </tweet>
   <tweet url="http://twitter.com/guppywon/statuses/63635343336939521 ">
      <from>guppywon (Chris Welch)</from>
      <subject>#mluc11 making truth telling safe and how to fight well is the topic of the great book "Crucial Conversations".</subject>
      <stamp>28-4-2011 18:07:02</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63635291491143680 ">
      <from>peteaven (peteaven)</from>
      <subject>innovation happens when people respect each other, but fight like crazy over ideas #MLUC11</subject>
      <stamp>28-4-2011 18:06:50</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63635286944514048 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#MLUC11 Innovation happens where people can"fight" in an environment of mutual respect</subject>
      <stamp>28-4-2011 18:06:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63635147907547136 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Innovation happens when people respect each other--but fight like crazy over ideas. -Bob Suttion #MLUC11</subject>
      <stamp>28-4-2011 18:06:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63635105121447936 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#MLUC11 very difficult to have an attitude of wisdom in a climate of fear.  Allow people to tell the truth about mistakes</subject>
      <stamp>28-4-2011 18:06:05</stamp>
   </tweet>
   <tweet url="http://twitter.com/shan_shif/statuses/63643249780338688 ">
      <from>shan_shif (Shannon S. Shiflett)</from>
      <subject>RT @dburley: #MLUC11 @work_matters : After people interact with you -- do they have MORE or LESS energy?</subject>
      <stamp>28-4-2011 18:38:27</stamp>
   </tweet>
   <tweet url="http://twitter.com/emdlc/statuses/63642971328880640 ">
      <from>emdlc (Ed D)</from>
      <subject>RT @NathanBrothers: #mluc11 check out "The Knowing Doing Gap" by Robert I. Sutton</subject>
      <stamp>28-4-2011 18:37:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/emdlc/statuses/63642811693666304 ">
      <from>emdlc (Ed D)</from>
      <subject>RT @MattLyles: #MLUC11 Best Management is sometimes no management at all</subject>
      <stamp>28-4-2011 18:36:43</stamp>
   </tweet>
   <tweet url="http://twitter.com/mochasteak/statuses/63642670274314241 ">
      <from>mochasteak (Brian Bishop)</from>
      <subject>RT @dburley: #MLUC11 @work_matters : more important to eliminate the negative than to accentuate the positive. Negativity is a contagion and energy sapp…</subject>
      <stamp>28-4-2011 18:36:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63642632496218112 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#MLUC11 Be like Pixar. Not afraid of failing, but afraid of mediocrity</subject>
      <stamp>28-4-2011 18:36:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/dburley/statuses/63642557636292608 ">
      <from>dburley (Diane Burley)</from>
      <subject>#MLUC11 @work_matters : Apple vs Google as innovators? neither steve nor sergey suffer mediocrity -- and both can make the tough decisions.</subject>
      <stamp>28-4-2011 18:35:42</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/63642468326969344 ">
      <from>dscape (Nuno Job)</from>
      <subject>RT @eedeebee NOTE: Thurs AM Dev Labs will be in Twin Peaks North (at end of sunset court) #MLUC11</subject>
      <stamp>28-4-2011 18:35:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/63642329386450944 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>@dransfim Don't forget that you're also grizzled.  #mluc11</subject>
      <stamp>28-4-2011 18:34:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/guppywon/statuses/63641954658955265 ">
      <from>guppywon (Chris Welch)</from>
      <subject>RT @MattLyles: #MLUC11 Bad interactions are 5 times stronger than 1 good interaction. Eliminate the negative vs improving the positive.</subject>
      <stamp>28-4-2011 18:33:19</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63641573371543552 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @dburley: #MLUC11 @work_matters : After people interact with you -- do they have MORE or LESS energy?</subject>
      <stamp>28-4-2011 18:31:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63641545143885824 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Key characteristic of successful team members: talking to them energizes you, doesn't sap your energy. #mluc11</subject>
      <stamp>28-4-2011 18:31:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/63641497001672705 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>RT @MattLyles: #MLUC11 Bad interactions are 5 times stronger than 1 good interaction. Eliminate the negative vs improving the positive.</subject>
      <stamp>28-4-2011 18:31:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/kev_burns/statuses/63641453573844992 ">
      <from>kev_burns (Kevin Burns)</from>
      <subject>RT @MattLyles: #MLUC11 Innovation is as much about selling ideas as it is inventing /creating them</subject>
      <stamp>28-4-2011 18:31:19</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63641374649614336 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>What effect do you have on the people around you? After an interaction, do they have more or less energy? #MLUC11</subject>
      <stamp>28-4-2011 18:31:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63641328835231744 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#MLUC11 What effects do you have on people around you? Do they have more or less energy?</subject>
      <stamp>28-4-2011 18:30:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/stevemallen/statuses/63650000500035585 ">
      <from>stevemallen (Steve Mallen)</from>
      <subject>The best management is sometimes no management at all - Robert Sutton #MLUC11</subject>
      <stamp>28-4-2011 19:05:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/63649991629082625 ">
      <from>dscape (Nuno Job)</from>
      <subject>RT @peteaven: #MLUC11 Dev Labs in Twin Peaks North today, Dev Lounge (lightning talks) still in Marina</subject>
      <stamp>28-4-2011 19:05:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/shan_shif/statuses/63647728575594496 ">
      <from>shan_shif (Shannon S. Shiflett)</from>
      <subject>RT @peteaven: Robert Sutton aka @work_matters rocked! Excellent start to the day #MLUC11</subject>
      <stamp>28-4-2011 18:56:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/StephenBuxton/statuses/63647395174551554 ">
      <from>StephenBuxton (stephen buxton)</from>
      <subject>#MLUC11 gag reel: ending a speaker intro with "please welcome me in joining ..."</subject>
      <stamp>28-4-2011 18:54:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/dburley/statuses/63647126839762944 ">
      <from>dburley (Diane Burley)</from>
      <subject>#MLUC11 Lindblad Award goes to LexisNexis Sr. Architect Jeff Seitter for spearheading innovation!</subject>
      <stamp>28-4-2011 18:53:52</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63646969071026178 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @mdubinko: Inaugural Linblad Award: Jeff Seitter, LexisNexis #MLUC11</subject>
      <stamp>28-4-2011 18:53:14</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63646736559775744 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Inaugural Linblad Award: Jeff Seitter, LexisNexis #MLUC11</subject>
      <stamp>28-4-2011 18:52:19</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63646407516631040 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>MarkLogic Excellence Awards: The Boeing Company, Dods Parliamentary Services, Kaplan Publishing, and partner Avalon Consulting #MLUC11</subject>
      <stamp>28-4-2011 18:51:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/dburley/statuses/63646188343263233 ">
      <from>dburley (Diane Burley)</from>
      <subject>#MLUC11 Congratulations Boeing Mission Systems, Dods Parliamentary Services &amp; Kaplan Publishing for MarkLogic Customer Excellence Awards!!</subject>
      <stamp>28-4-2011 18:50:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/willseth/statuses/63645885057347584 ">
      <from>willseth (Will Thompson)</from>
      <subject>Has anyone been able to submit session feedback using the #mluc11 mobile site?</subject>
      <stamp>28-4-2011 18:48:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/hiteshc1/statuses/63645858759053314 ">
      <from>hiteshc1 (Hitesh)</from>
      <subject>@work_matters thanks for a great talk! Inspiring.  My takeaway - embrace the mess, retire the old product once we have new. #MLUC11</subject>
      <stamp>28-4-2011 18:48:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/guppywon/statuses/63645831655456768 ">
      <from>guppywon (Chris Welch)</from>
      <subject>Innovation is best measured by measures of cultural openness, not R&amp;D spend. Easier said than done when reviving org. #mluc11</subject>
      <stamp>28-4-2011 18:48:43</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63645614231138304 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @mdubinko: If you have more energy after hearing Bob Sutton speak, check out his blog for more: http://t.co/udK1i2J #MLUC11</subject>
      <stamp>28-4-2011 18:47:51</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/63645320608890881 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>Do you have a safe place to fail? #mluc11</subject>
      <stamp>28-4-2011 18:46:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63645290938380288 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>RT @mdubinko: If you have more energy after hearing Bob Sutton speak, check out his blog for more: http://t.co/udK1i2J #MLUC11</subject>
      <stamp>28-4-2011 18:46:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63658537917743104 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#MLUC11 Social Phenomena: What publishers want - cust. acquisition, cust. engagement, increase sales, cust. retention</subject>
      <stamp>28-4-2011 19:39:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63658357826912256 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#MLUC11 Social Phenonmena: what customers want - credible info, co-creation, ideas, expression, entertainment, sharing, inspiration, help</subject>
      <stamp>28-4-2011 19:38:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/63658075139219456 ">
      <from>xquery (james fuller)</from>
      <subject>@collwhit demoing cool live monitoring dashboard whilst data ingestion ... #MLUC11</subject>
      <stamp>28-4-2011 19:37:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/mikeyhu/statuses/63658068197642240 ">
      <from>mikeyhu (Mike Hughes)</from>
      <subject>Planning ahead is currently important to keep ML clusters up.  Can this be improved? Its seems so! #mluc11</subject>
      <stamp>28-4-2011 19:37:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63658046357905408 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Running a 1,000,000 document load live FTW! Monitoring dashboard graphs look great. #MLUC11</subject>
      <stamp>28-4-2011 19:37:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/d3clan/statuses/63657808842862592 ">
      <from>d3clan (Declan Newman)</from>
      <subject>Bob Sutton's keynote this morning was excellent. Very interesting insight into team dynamics in large orgs. #mluc11</subject>
      <stamp>28-4-2011 19:36:18</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63657644543582208 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Before joining AppServices @collwhit spent time on customer solutions, so she has a strong background in monitoring requirements. #MLUC11</subject>
      <stamp>28-4-2011 19:35:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63657456370327553 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>This talk is a summary of Jason's "Inside MarkLogic" white paper. #mluc11</subject>
      <stamp>28-4-2011 19:34:54</stamp>
   </tweet>
   <tweet url="http://twitter.com/decisionstats/statuses/63657098122248193 ">
      <from>decisionstats (Ajay Ohri)</from>
      <subject>RT @marksmithvr: @merv Greatly appreciated saving me the last seat, next time I buy you a drink!  #mluc11</subject>
      <stamp>28-4-2011 19:33:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/marksmithvr/statuses/63656892836216832 ">
      <from>marksmithvr (Mark Smith)</from>
      <subject>@merv Greatly appreciated saving me the last seat, next time I buy you a drink!  #mluc11</subject>
      <stamp>28-4-2011 19:32:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63656848879910912 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Ready to hear Jason Hunter talk about MarkLogic indexing. #mluc11</subject>
      <stamp>28-4-2011 19:32:30</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63656739215650816 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Monitoring MarkLogic Clusters for Health and (DBA) Happiness, Today and Tomorrow. by @collwhit  #MLUC11</subject>
      <stamp>28-4-2011 19:32:03</stamp>
   </tweet>
   <tweet url="http://twitter.com/ContentNation/statuses/63655809871126528 ">
      <from>ContentNation (Content Nation)</from>
      <subject>#tech MarkLogic Excellence Awards Winners http://j.mp/lSR8oE Vendor conferences doing more of the right things #mluc11</subject>
      <stamp>28-4-2011 19:28:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/jblossom/statuses/63655809674002433 ">
      <from>jblossom (John Blossom)</from>
      <subject>#tech MarkLogic Excellence Awards Winners http://j.mp/lSR8oE Vendor conferences doing more of the right things #mluc11</subject>
      <stamp>28-4-2011 19:28:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/justinknol/statuses/63655613107937280 ">
      <from>justinknol (Justin Knol)</from>
      <subject>RT @stevemallen: The best management is sometimes no management at all - Robert Sutton #MLUC11</subject>
      <stamp>28-4-2011 19:27:35</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63666082958946304 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @mdubinko: "A Great Leader Isn't Enough: What Innovative Teams Do" Robert Sutton, Stanford University #MLUC11</subject>
      <stamp>28-4-2011 20:09:11</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/63666028311363585 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>Rob Rudin is describing my life with spooky accuracy at #mluc11 Java 2 XQuery</subject>
      <stamp>28-4-2011 20:08:58</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63665921486618625 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Sorting happens prior to filtering. #mluc11</subject>
      <stamp>28-4-2011 20:08:33</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63665800485150720 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>The "Query execution time" graph is hypnotic. You can see the ebb and flow of the system in realtime. #MLUC11</subject>
      <stamp>28-4-2011 20:08:04</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63665253753434112 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>If data doesn't match expected data type, will get an error. #mluc11</subject>
      <stamp>28-4-2011 20:05:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63664993857568768 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>HP Operations Manager integration discussed. No screen shot, so I can't tell if Will likes it. :) #MLUC11</subject>
      <stamp>28-4-2011 20:04:52</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63664959447511040 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Range indexes: define when need scalar queries. Eg, qname to date range index. #mluc11</subject>
      <stamp>28-4-2011 20:04:43</stamp>
   </tweet>
   <tweet url="http://twitter.com/d3clan/statuses/63664480894197760 ">
      <from>d3clan (Declan Newman)</from>
      <subject>I'd like yo know why Rob Rudin  chose not to use Maven.  #mluc11</subject>
      <stamp>28-4-2011 20:02:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63664179332132864 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Nagios screen shot. Will LaForest thinks it's beautiful. :) #MLUC11</subject>
      <stamp>28-4-2011 20:01:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63664007361470465 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Jason's white paper: http://bit.ly/lQsFUg #mluc11</subject>
      <stamp>28-4-2011 20:00:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63663267041644544 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>And others - element-word index, element-phrase index. #mluc11</subject>
      <stamp>28-4-2011 19:58:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63663230018519040 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>prototype REST API speaks HTML, JSON, and XML, or other formats via plugin support #MLUC11</subject>
      <stamp>28-4-2011 19:57:51</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/63663052192620545 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>Boeing use JDOM as part of their TDD testing strategy. @hunterhacker #MLUC11</subject>
      <stamp>28-4-2011 19:57:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/Luigeee/statuses/63662943149096960 ">
      <from>Luigeee (Luigi)</from>
      <subject>RT @lisabos: Teaching is about selectively lying to people @hunterhacker #mluc11</subject>
      <stamp>28-4-2011 19:56:43</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63662854951276545 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Showing a prototype REST API for monitoring info, fully navigable in a browser by clicking on links. #MLUC11</subject>
      <stamp>28-4-2011 19:56:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/jpcs/statuses/63673698015657986 ">
      <from>jpcs (John Snelson)</from>
      <subject>Peter O'Kelly talks on #xquery adoption. #MLUC11</subject>
      <stamp>28-4-2011 20:39:27</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63673473905598464 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Lots of talk this week about speed of prototype development in MarkLogic. Now at a presentation on that topic. #mluc11</subject>
      <stamp>28-4-2011 20:38:33</stamp>
   </tweet>
   <tweet url="http://twitter.com/justinknol/statuses/63673310495510530 ">
      <from>justinknol (Justin Knol)</from>
      <subject>RT @mdubinko: Peter O'Kelly Bullet: "Why XQuery is awesome" #MLUC11</subject>
      <stamp>28-4-2011 20:37:54</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63673293185617920 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Peter O'Kelly's background at Lotus, IBM, Groove, Macromedia, Microsoft, offering a non-MarkLogic perspective at the conference. #MLUC11</subject>
      <stamp>28-4-2011 20:37:50</stamp>
   </tweet>
   <tweet url="http://twitter.com/jpcs/statuses/63673216329195520 ">
      <from>jpcs (John Snelson)</from>
      <subject>The standard of #xquery talks here at #MLUC11 is extremely high. Some very valuable insights from users.</subject>
      <stamp>28-4-2011 20:37:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/d3clan/statuses/63673027870736384 ">
      <from>d3clan (Declan Newman)</from>
      <subject>From Relational to XML: A Controlled Migration - Will Funnell, IOP Publishing - just started #mluc11</subject>
      <stamp>28-4-2011 20:36:47</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63672965698564096 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Peter O'Kelly Bullet: "Why XQuery is awesome" #MLUC11</subject>
      <stamp>28-4-2011 20:36:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63672411039604737 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Huge rush of last-minute arrivals for the XQuery Information Architecture talk in the Twin Peaks South room. Don't miss out! #MLUC11</subject>
      <stamp>28-4-2011 20:34:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63671443547885569 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Lexicons implemented as range indexes #mluc11</subject>
      <stamp>28-4-2011 20:30:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63670473153716224 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Database is partitioned into forests, queries run inside a forest. #mluc11</subject>
      <stamp>28-4-2011 20:26:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63670330765475840 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>an XQuery wrapped in an enigma: Peter O'Kelly on XQuery's Enigmatic Information Architecture role #MLUC11</subject>
      <stamp>28-4-2011 20:26:04</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63670301204033537 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Cool example of composed query - matching drivers and passengers for commuter pairs based on needs of both. #mluc11</subject>
      <stamp>28-4-2011 20:25:57</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63669274912370688 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Alerts via reverse indexes. Tell me when there are queries that match insert/update. #mluc11</subject>
      <stamp>28-4-2011 20:21:52</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63668991146737665 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Check out registered queries - everyone should use. #mluc11</subject>
      <stamp>28-4-2011 20:20:45</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63668765266677760 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Also spatial indexing. Too much for the talk, much less tweet. See white paper. #mluc11</subject>
      <stamp>28-4-2011 20:19:51</stamp>
   </tweet>
   <tweet url="http://twitter.com/yuxipacific/statuses/63681222605410304 ">
      <from>yuxipacific (Michael Puscar)</from>
      <subject>RT @peteaven: innovation happens when people respect each other, but fight like crazy over ideas #MLUC11</subject>
      <stamp>28-4-2011 21:09:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/mochasteak/statuses/63681087230058496 ">
      <from>mochasteak (Brian Bishop)</from>
      <subject>Great talk about Java to XQuery @ Boeing “@leepollington: Rob Rudin is describing my life with spooky accuracy at #mluc11 Java 2 XQuery”</subject>
      <stamp>28-4-2011 21:08:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/yuxipacific/statuses/63681050311790592 ">
      <from>yuxipacific (Michael Puscar)</from>
      <subject>RT @lisabos: Can also use Information Studio to define transformations to use when loading content. Uses CPF under the covers.  #mluc11</subject>
      <stamp>28-4-2011 21:08:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63680989850910721 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>XQuery book by Jim Melton and Stephen Buxton: http://t.co/dlDR7oc #MLUC11</subject>
      <stamp>28-4-2011 21:08:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/jpcs/statuses/63680920661659648 ">
      <from>jpcs (John Snelson)</from>
      <subject>Next wave of #xquery momentum will come from Content Management Systems. #MLUC11</subject>
      <stamp>28-4-2011 21:08:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63680657242599424 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>And there's the pretty search app. Now to override the code with some XQuery to add a histogram. #mluc11</subject>
      <stamp>28-4-2011 21:07:06</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63680525101051905 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>XML-focused app development often starts off with pre-built Schemas, so the "greenfield" design process may get bypassed. #MLUC11</subject>
      <stamp>28-4-2011 21:06:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63679769501384705 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Most people benefitting from SQL are note using it directly. E.g. reporting applications. #MLUC11</subject>
      <stamp>28-4-2011 21:03:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63679138883575808 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Need some range indexes for the search facets in the prototype demo. Information Studio guides that process. #mluc11</subject>
      <stamp>28-4-2011 21:01:04</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63678873036005376 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>If you're using a DBMS as a glorified file system, you're probably paying a lot for little benefit. #MLUC11</subject>
      <stamp>28-4-2011 21:00:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63678017779666944 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Large organizations tend to have distinct "content" and "data" groups, with little collaboration between. #MLUC11</subject>
      <stamp>28-4-2011 20:56:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/robstoltz/statuses/63677895595397120 ">
      <from>robstoltz (Rob Stoltz)</from>
      <subject>Agreed! RT @mdubinko Most #NoSQL debates happen at the physical level. People should be dwelling at higher conceptual levels. #MLUC11</subject>
      <stamp>28-4-2011 20:56:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/jpcs/statuses/63677873663389696 ">
      <from>jpcs (John Snelson)</from>
      <subject>The #nosql debate is mostly at the physical level of modelling, but most people should be discussing the conceptual level. #MLUC11</subject>
      <stamp>28-4-2011 20:56:02</stamp>
   </tweet>
   <tweet url="http://twitter.com/dransfim/statuses/63677644826357765 ">
      <from>dransfim (martin dransfield)</from>
      <subject>Peter O'Kelly is saying really interesting things about Resources vs Relations &amp; xqy vs sql. #mluc11</subject>
      <stamp>28-4-2011 20:55:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63677444518981632 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Most #NoSQL debates happen at the physical level. People should be dwelling at higher conceptual levels. #MLUC11</subject>
      <stamp>28-4-2011 20:54:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/gimsieke/statuses/63684046898741248 ">
      <from>gimsieke (Gerrit Imsieke)</from>
      <subject>RT @mdubinko: "The un-queried life is not worth living" Socrates paraphrased on the W3C XQuery page. #MLUC11</subject>
      <stamp>28-4-2011 21:20:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63682669480906752 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @jpcs: The #nosql debate is mostly at the physical level of modelling, but most people should be discussing the conceptual level. #MLUC11</subject>
      <stamp>28-4-2011 21:15:06</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63682526673256448 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @mdubinko: "The un-queried life is not worth living" Socrates paraphrased on the W3C XQuery page. #MLUC11</subject>
      <stamp>28-4-2011 21:14:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63682485762015232 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Data modeling book mentioned by Peter O'Kelly: http://t.co/AJUp3gD #MLUC11</subject>
      <stamp>28-4-2011 21:14:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63682277317689344 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Recommendations: treat modeling as a success factor. #MLUC11</subject>
      <stamp>28-4-2011 21:13:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63681875197173760 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Recommendations: place well-informed standards bets. #MLUC11</subject>
      <stamp>28-4-2011 21:11:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63681340943507456 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>#NoSQL evolution: "no SQL" -&gt; "not only SQL" -&gt; "new opportunities for SQL" #MLUC11 #abittongueincheek</subject>
      <stamp>28-4-2011 21:09:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/StephenBuxton/statuses/63688891458256896 ">
      <from>StephenBuxton (stephen buxton)</from>
      <subject>#MLUC11 Learning curve for XQuery: a Java programmer can pick it up "in a matter of weeks" (Rob Rudin, Boeing Information Systems)</subject>
      <stamp>28-4-2011 21:39:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/StephenBuxton/statuses/63689435685986304 ">
      <from>StephenBuxton (stephen buxton)</from>
      <subject>#MLUC11 #gagreel "Oracle's great - I've been using it for 20-some years and it hasn't changed a bit" (Bruce Bumgarner, Raytheon)</subject>
      <stamp>28-4-2011 21:41:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/63703821553106944 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Starting in 5 minutes: double-header session on BLOBs and Configuration Management. Sea Cliff room filling fast--hurry! #MLUC11</subject>
      <stamp>28-4-2011 22:39:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63837475495354370 ">
      <from>Grtjn (Geert)</from>
      <subject>:) RT @xquery: conference is inspiring too many (I think) good ideas I will end up having to kill off #MLUC11 must be focused !</subject>
      <stamp>29-4-2011 7:30:14</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63837152793985024 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @MarkLogic: "It's not Big Data, it's Extreme Information Management" Donald Feinberg, #Gartner #MLUC11</subject>
      <stamp>29-4-2011 7:28:57</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/63836749033508865 ">
      <from>Grtjn (Geert)</from>
      <subject>+1 RT @mdubinko: Dipti also discussing metadata extraction from binary formats like PDF, jpg, mov, etc. (over 200 formats) #MLUC11</subject>
      <stamp>29-4-2011 7:27:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/shan_shif/statuses/63828578181197825 ">
      <from>shan_shif (Shannon S. Shiflett)</from>
      <subject>RT @xquery: conference is inspiring too many (I think) good ideas I will end up having to kill off #MLUC11 must be focused !</subject>
      <stamp>29-4-2011 6:54:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/63826630853931008 ">
      <from>xquery (james fuller)</from>
      <subject>like .... a prolog rules processor written in xquery ... can someone else does this please. #MLUC11</subject>
      <stamp>29-4-2011 6:47:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/63826339525967873 ">
      <from>xquery (james fuller)</from>
      <subject>conference is inspiring too many (I think) good ideas I will end up having to kill off #MLUC11 must be focused !</subject>
      <stamp>29-4-2011 6:45:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/63825869235425280 ">
      <from>xquery (james fuller)</from>
      <subject>RT @mdubinko: Q: Where is XQuery heading? John Snelson answers: Lambda/higher-order functions, positional grouping, try/catch, maps #MLUC11</subject>
      <stamp>29-4-2011 6:44:07</stamp>
   </tweet>
   <tweet url="http://twitter.com/sagarbhujbal/statuses/63810475351220224 ">
      <from>sagarbhujbal (Sagar Bhujbal)</from>
      <subject>Opportunity to meet few #marklogic customers who needed addn features in s/w &amp; every1 said ML included it in there roadmap.Impressed #mluc11</subject>
      <stamp>29-4-2011 5:42:57</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/63809387503951872 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>MarkLogic throws a good party #mluc11 http://yfrog.com/gzoz0ipj</subject>
      <stamp>29-4-2011 5:38:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/63785164127473665 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>It's a frickin' ice sculpture #mluc11  http://t.co/VLarmB7</subject>
      <stamp>29-4-2011 4:02:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/63768269072502784 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>@mdubinko As long as you're flogging books, how about "Getting Started With XQuery?  http://t.co/tUTIWbq  #mluc11</subject>
      <stamp>29-4-2011 2:55:14</stamp>
   </tweet>
   <tweet url="http://twitter.com/jchakra/statuses/63757678014504960 ">
      <from>jchakra (Jay Chakrapani)</from>
      <subject>RT @sagarbhujbal: It's easy to kill lousy #ideas. To be a great company, you will need to kill most of good ideas too - Steve Jobs 8 yrs ago. #mluc11</subject>
      <stamp>29-4-2011 2:13:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/SethGrimes/statuses/63756795411300352 ">
      <from>SethGrimes (Seth Grimes)</from>
      <subject>.@dburley There's much, much more to Big Data than just information-management concerns, extreme or not. #MLUC11</subject>
      <stamp>29-4-2011 2:09:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63751619799560192 ">
      <from>peteaven (peteaven)</from>
      <subject>use cases &lt;- applications &lt;- metadata &lt;- info platform(buckets of aggregation) &lt;- information sources #MLUC11</subject>
      <stamp>29-4-2011 1:49:05</stamp>
   </tweet>
   <tweet url="http://twitter.com/dburley/statuses/63751225199443968 ">
      <from>dburley (Diane Burley)</from>
      <subject>#MLUC11 Metadata management layer lets you tie together any/all organizational information.</subject>
      <stamp>29-4-2011 1:47:31</stamp>
   </tweet>
   <tweet url="http://twitter.com/jclip/statuses/63839933902761984 ">
      <from>jclip (James Clippinger)</from>
      <subject>Playing poker (poorly) at #MLUC11</subject>
      <stamp>29-4-2011 7:40:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/prooney625/statuses/63850666602401792 ">
      <from>prooney625 (Paul Rooney)</from>
      <subject>RT @ronhitchens: It's a frickin' ice sculpture #mluc11  http://t.co/VLarmB7</subject>
      <stamp>29-4-2011 8:22:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/paulbaan/statuses/63849239679209472 ">
      <from>paulbaan (paulbaan)</from>
      <subject>RT @MarkLogic: "It's not Big Data, it's Extreme Information Management" Donald Feinberg, #Gartner #MLUC11</subject>
      <stamp>29-4-2011 8:16:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/63879196438577152 ">
      <from>eedeebee (eedeebee)</from>
      <subject>RT @ronhitchens: Dr. Lindblad explains it all:   #mluc11 http://t.co/efKYmHT</subject>
      <stamp>29-4-2011 10:16:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/apprelevance/statuses/63938745598095360 ">
      <from>apprelevance (Applied Relevance)</from>
      <subject>Red hot taxonomy action station. #MLUC11 http://t.co/Mx0No0b</subject>
      <stamp>29-4-2011 14:12:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/apprelevance/statuses/63938160689819648 ">
      <from>apprelevance (Applied Relevance)</from>
      <subject>Stop by the AR Kiosk at #MLUC11 for a funny joke about snails, nuns or a Norse god.  Your choice.  Or, tell me a joke.</subject>
      <stamp>29-4-2011 14:10:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/marksmithvr/statuses/63962788082622464 ">
      <from>marksmithvr (Mark Smith)</from>
      <subject>Thanks to MarkLogic team for a great #MLUC11 - Keep pushing the envelope on what's possible with your information platform &amp; apps!</subject>
      <stamp>29-4-2011 15:48:11</stamp>
   </tweet>
   <tweet url="http://twitter.com/fgeorges/statuses/63950938137837568 ">
      <from>fgeorges (Florent Georges)</from>
      <subject>RT @mdubinko: Parting tip for XQuery programmers: don't treat it like an imperative/procedural language. More Scheme than Java. #MLUC11</subject>
      <stamp>29-4-2011 15:01:06</stamp>
   </tweet>
   <tweet url="http://twitter.com/fgeorges/statuses/63950574986608640 ">
      <from>fgeorges (Florent Georges)</from>
      <subject>RT @leepollington: Chris Lindblad: "I wrote XQuery like lisp" #mluc11</subject>
      <stamp>29-4-2011 14:59:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/MattLyles/statuses/63947876635656192 ">
      <from>MattLyles (Matt Lyles)</from>
      <subject>#MLUC11 So long @MarkLogic. Thanks for a great conference. Now I'm off to kill some good ideas http://4sq.com/mKl9lS</subject>
      <stamp>29-4-2011 14:48:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/tomkrieglstein/statuses/63983280759914498 ">
      <from>tomkrieglstein (Tom Krieglstein)</from>
      <subject>RT @sagarbhujbal: It's easy to kill lousy #ideas. To be a great company, you will need to kill most of good ideas too - Steve Jobs 8 yrs ago. #mluc11</subject>
      <stamp>29-4-2011 17:09:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/63982221354217472 ">
      <from>dscape (Nuno Job)</from>
      <subject>RT @ronhitchens: Dr. Lindblad explains it all:   #mluc11 http://t.co/efKYmHT</subject>
      <stamp>29-4-2011 17:05:24</stamp>
   </tweet>
   <tweet url="http://twitter.com/golllog/statuses/63996999455866880 ">
      <from>golllog (Gol Log)</from>
      <subject>#mluc11 tweet tweet</subject>
      <stamp>29-4-2011 18:04:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63996491013959680 ">
      <from>peteaven (peteaven)</from>
      <subject>#correction Dev Lab: Word/Excel document generation using the MarkLogic Toolkits for Office at 11:20am in Sierra Room #MLUC11 #XQuery</subject>
      <stamp>29-4-2011 18:02:07</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/63994398651850752 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>Morning panel lead by founder Lindblad about to get on stage for last morning of conference #MLUC11</subject>
      <stamp>29-4-2011 17:53:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63993678108180481 ">
      <from>peteaven (peteaven)</from>
      <subject>#MLUC11 @avnur just walked by &amp; asked if I was ready to heckle.  #affirmative Q &amp; A w/ founder &amp; tech experts starts in 10 mins!</subject>
      <stamp>29-4-2011 17:50:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/63992016744366081 ">
      <from>peteaven (peteaven)</from>
      <subject>Can't believe is the final day of #MLUC11 already</subject>
      <stamp>29-4-2011 17:44:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/ContentNation/statuses/63990845791145984 ">
      <from>ContentNation (Content Nation)</from>
      <subject>#tech BSI Transforming its Standards Documentation http://j.mp/kulNMw #mluc11 Powerful and flexible document assembly</subject>
      <stamp>29-4-2011 17:39:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/jblossom/statuses/63990845774381056 ">
      <from>jblossom (John Blossom)</from>
      <subject>#tech BSI Transforming its Standards Documentation http://j.mp/kulNMw #mluc11 Powerful and flexible document assembly</subject>
      <stamp>29-4-2011 17:39:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64004974807494656 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Kelly's favorite feature: local disk replication. Alternative to SAN. #MLUC11</subject>
      <stamp>29-4-2011 18:35:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64004762617659392 ">
      <from>peteaven (peteaven)</from>
      <subject>.@wfeick maintaining his @kstirman assigned reputation as master of the mindbender #MLUC11</subject>
      <stamp>29-4-2011 18:34:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64004329245392896 ">
      <from>peteaven (peteaven)</from>
      <subject>. @wfeick's future feature favorite: cluster communication.  current work leads to clusters of clusters. #supercluster #MLUC11</subject>
      <stamp>29-4-2011 18:33:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64004316532453376 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Wayne excited about different ways of interconnecting clusters for distributed storage #MLUC11</subject>
      <stamp>29-4-2011 18:33:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/NathanBrothers/statuses/64004170801356801 ">
      <from>NathanBrothers (Nathan Brothers)</from>
      <subject>#mluc11 I want to see video speech-to text extraction and semantic triple extraction from that text.</subject>
      <stamp>29-4-2011 18:32:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64003954421415936 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Jason Hunter excited about multi-statement transactions. Oft-requested feature, useful in multi-step transformations. #MLUC11</subject>
      <stamp>29-4-2011 18:31:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64003874511532036 ">
      <from>peteaven (peteaven)</from>
      <subject>when it comes to upcoming features, @hunterhacker loves them all.  multi-statement transactions is his current favorite #MLUC11</subject>
      <stamp>29-4-2011 18:31:27</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64003801836830720 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Christmas isn't nearly as exciting as a new release of MarkLogic @hunterhacker #mluc11</subject>
      <stamp>29-4-2011 18:31:10</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64003414014693376 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Linblad: if you're designing a database with massive binary storage, need to think more about I/O capacity. #MLUC11</subject>
      <stamp>29-4-2011 18:29:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64003295957614593 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Oops, talking to a real live person and missed the first part of the session when I won a prize for being #mluc11 Twitter girl.</subject>
      <stamp>29-4-2011 18:29:09</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64002782637719554 ">
      <from>peteaven (peteaven)</from>
      <subject>. @mathling also excited about binary support. opens the doors for even more filetypes (100s) &amp; capturing image metadata. #MLUC11</subject>
      <stamp>29-4-2011 18:27:07</stamp>
   </tweet>
   <tweet url="http://twitter.com/justinknol/statuses/64002511383699456 ">
      <from>justinknol (Justin Knol)</from>
      <subject>RT @mdubinko: Structured is the special case of Unstructured. #MLUC11</subject>
      <stamp>29-4-2011 18:26:02</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/64002360875290624 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>RT @peteaven: .@chris_biow "they're such a perfect complementary pair" on #marklogic #hadoop integration #MLUC11</subject>
      <stamp>29-4-2011 18:25:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/sagarbhujbal/statuses/64002341883494400 ">
      <from>sagarbhujbal (Sagar Bhujbal)</from>
      <subject>MarkLogic should focus more on data which is binary and make it easier to use for customers says founder Dr. Lindblad #mluc11</subject>
      <stamp>29-4-2011 18:25:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64002233964044288 ">
      <from>peteaven (peteaven)</from>
      <subject>lindblad most excited about enhanced binary support. no size limits, easier to manage, sets stage for more in that area in future #MLUC11</subject>
      <stamp>29-4-2011 18:24:56</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64012502224220160 ">
      <from>peteaven (peteaven)</from>
      <subject>awesome morning session! had to leave early tho set up for presentation at 10:15.  Talkin Excel &amp; Toolkits in presidio @ 10:15 #MLUC11</subject>
      <stamp>29-4-2011 19:05:44</stamp>
   </tweet>
   <tweet url="http://twitter.com/shan_shif/statuses/64012401179238400 ">
      <from>shan_shif (Shannon S. Shiflett)</from>
      <subject>RT @tomstilwell: @kstirman rocked it as tech panel host #MLUC11 kept it light &amp; engaging. Can't wait for @MarkLogic brainiacs to finish 5.0</subject>
      <stamp>29-4-2011 19:05:20</stamp>
   </tweet>
   <tweet url="http://twitter.com/ContentNation/statuses/64012112044892160 ">
      <from>ContentNation (Content Nation)</from>
      <subject>#tech http://j.mp/kW9AtU Mark Logic Execs sound off #mluc11 of Watson, SSDs and tuning for nanosecond performance</subject>
      <stamp>29-4-2011 19:04:11</stamp>
   </tweet>
   <tweet url="http://twitter.com/jblossom/statuses/64012111906471937 ">
      <from>jblossom (John Blossom)</from>
      <subject>#tech http://j.mp/kW9AtU Mark Logic Execs sound off #mluc11 of Watson, SSDs and tuning for nanosecond performance</subject>
      <stamp>29-4-2011 19:04:11</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64011686117523456 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Who is the pessimist in the group? "It's a rotating position," quips Chris Linblad. #MLUC11</subject>
      <stamp>29-4-2011 19:02:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/kwaxon/statuses/64011391002099713 ">
      <from>kwaxon (Kate Waxon)</from>
      <subject>MarkLogic: "We avoid doing work that doesn't need to be done." #mluc11</subject>
      <stamp>29-4-2011 19:01:19</stamp>
   </tweet>
   <tweet url="http://twitter.com/dransfim/statuses/64011253013684224 ">
      <from>dransfim (martin dransfield)</from>
      <subject>Stirman: "not all cores are created equal?" Lindblad: "don't buy sparc" #mluc11</subject>
      <stamp>29-4-2011 19:00:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64011207706804224 ">
      <from>peteaven (peteaven)</from>
      <subject>.@hunterhacker &amp; lindblad take conversation to level of computer science geekery that loses @kstirman :) #MLUC11</subject>
      <stamp>29-4-2011 19:00:35</stamp>
   </tweet>
   <tweet url="http://twitter.com/tomstilwell/statuses/64011086193623043 ">
      <from>tomstilwell (Tom Stilwell)</from>
      <subject>@kstirman rocked it as tech panel host #MLUC11 kept it light &amp; engaging. Can't wait for @MarkLogic brainiacs to finish 5.0</subject>
      <stamp>29-4-2011 19:00:06</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64010887140347904 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Who needs 8-core chips? "We do." Embarrassingly parallel code can take advantage of it. #MLUC11</subject>
      <stamp>29-4-2011 18:59:19</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64010722258071552 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Lindblad expounding on the joys of getting to apply comp sci algorithm theory on a regular basis when working on MarkLogic. #mluc11</subject>
      <stamp>29-4-2011 18:58:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64010621401841664 ">
      <from>peteaven (peteaven)</from>
      <subject>lindblad: "what's exciting is all that stuff you learned in Algorithms class, you need to use it" #MLUC11</subject>
      <stamp>29-4-2011 18:58:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64010338026262529 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>"Engineering at MarkLogic is cool because you actually use the stuff you learned in comp-sci" -founder Chris Linblad #MLUC11</subject>
      <stamp>29-4-2011 18:57:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64010045192544258 ">
      <from>peteaven (peteaven)</from>
      <subject>lindblad calls it "baloney slicing", constantly shaving off time where he can to improve performance #MLUC11</subject>
      <stamp>29-4-2011 18:55:58</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64009503561105409 ">
      <from>peteaven (peteaven)</from>
      <subject>lindblad (on the speed of MarkLogic Server): it's fast because we're constantly working on it to be fast, we're never done. #MLUC11</subject>
      <stamp>29-4-2011 18:53:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/hunterhacker/statuses/64019848103067649 ">
      <from>hunterhacker (Jason Hunter)</from>
      <subject>RT @lisabos: Christmas isn't nearly as exciting as a new release of MarkLogic @hunterhacker #mluc11</subject>
      <stamp>29-4-2011 19:34:55</stamp>
   </tweet>
   <tweet url="http://twitter.com/ReallySI/statuses/64019680653885440 ">
      <from>ReallySI (Really Strategies)</from>
      <subject>"Data lasts longer than code Treat it right." Love that road sign in Chet Hayes' Value of an Enterprise Data Layer talk. #mluc11</subject>
      <stamp>29-4-2011 19:34:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/jclip/statuses/64019619228286976 ">
      <from>jclip (James Clippinger)</from>
      <subject>Don't lose sight of the fact that it's the data, not the code, that is valuable @cdhayes at #MLUC11</subject>
      <stamp>29-4-2011 19:34:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/64019134446444544 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>I was the one holding the club, ready to beat up @hunterhacker re: lack of multiple-statement transactions.  Hoisted a pint instead #mluc11</subject>
      <stamp>29-4-2011 19:32:05</stamp>
   </tweet>
   <tweet url="http://twitter.com/caschwartz/statuses/64018769537810432 ">
      <from>caschwartz (Christine Schwartz)</from>
      <subject>RT @mdubinko: Next year's #MLUC is on the East Coast April 30 - May 3, 2012 #MLUC11 #MLUC12</subject>
      <stamp>29-4-2011 19:30:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64017358636855296 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>XQuery Unit Testing, subtitled "Fun with Jake Trent" :) #MLUC11</subject>
      <stamp>29-4-2011 19:25:02</stamp>
   </tweet>
   <tweet url="http://twitter.com/shan_shif/statuses/64016657290506240 ">
      <from>shan_shif (Shannon S. Shiflett)</from>
      <subject>My next to last breakout session at #MLUC11  http://t.co/cKOU11D</subject>
      <stamp>29-4-2011 19:22:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/shan_shif/statuses/64016148341063680 ">
      <from>shan_shif (Shannon S. Shiflett)</from>
      <subject>RT @mdubinko: Next year's #MLUC is on the East Coast April 30 - May 3, 2012 #MLUC11 #MLUC12</subject>
      <stamp>29-4-2011 19:20:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/shan_shif/statuses/64014070986190849 ">
      <from>shan_shif (Shannon S. Shiflett)</from>
      <subject>Q: Why do you stay? A: "I don't want to be the slow one. I like the competition to try to keep up." Jason Hunter ( @hunterhacker )  #MLUC11</subject>
      <stamp>29-4-2011 19:11:58</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64013262068523008 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Next year's #MLUC is on the East Coast April 30 - May 3, 2012 #MLUC11 #MLUC12</subject>
      <stamp>29-4-2011 19:08:45</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/64013074008514560 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>Good job, Kenny Sprewell #mluc11</subject>
      <stamp>29-4-2011 19:08:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/MarkLogic/statuses/64012979712172032 ">
      <from>MarkLogic (MarkLogic)</from>
      <subject>Who is the grumpy in the group?(ref. to Sutton's keynote that every team needs a grumpy) "It's a rotating position," Chris Lindblad. #MLUC11</subject>
      <stamp>29-4-2011 19:07:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64012823918952448 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Summary: amazing culture and work ethic at MarkLogic #MLUC11</subject>
      <stamp>29-4-2011 19:07:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/dransfim/statuses/64026229182955521 ">
      <from>dransfim (martin dransfield)</from>
      <subject>@ronhitchens @hunterhacker no, i'm Spartacus! #mluc11</subject>
      <stamp>29-4-2011 20:00:17</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/64026154801184768 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>RT @eedeebee: RT @mdubinko: Next year's #MLUC is on the East Coast April 30 - May 3, 2012 #MLUC11 #MLUC12</subject>
      <stamp>29-4-2011 19:59:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/jhilgerbc/statuses/64026066821451776 ">
      <from>jhilgerbc (Joseph Hilger)</from>
      <subject>RT @mdubinko: XqTest: a home-built framework for XQuery unit testing. declare function (:TEST:) funcname() {{ ... }} #MLUC11</subject>
      <stamp>29-4-2011 19:59:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64025089464729600 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>And the code Jake Trent is talking about:  http://t.co/CZp17za #MLUC11</subject>
      <stamp>29-4-2011 19:55:45</stamp>
   </tweet>
   <tweet url="http://twitter.com/kstirman/statuses/64024822493102080 ">
      <from>kstirman (Kelly Stirman)</from>
      <subject>Thanks to Mary, Jason, Wayne, Lindblad, Biow for being a great panel. #mluc11. Good times, great oldies.</subject>
      <stamp>29-4-2011 19:54:41</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64024035062845440 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>XqTest: a home-built framework for XQuery unit testing. declare function (:TEST:) funcname() {{ ... }} #MLUC11</subject>
      <stamp>29-4-2011 19:51:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64023515640246272 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>although Gray-box testing often ends up what happens in practice. #MLUC11</subject>
      <stamp>29-4-2011 19:49:30</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64023343392759809 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Jake Trent suggests making unit testing as black-box as possible. #MLUC11</subject>
      <stamp>29-4-2011 19:48:49</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64022976235966464 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Beware of hidden dependencies: calls to the database or network sprinkled inline in code. #MLUC11</subject>
      <stamp>29-4-2011 19:47:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/chillSea/statuses/64021809951023104 ">
      <from>chillSea (Christopher Hill)</from>
      <subject>It is clearly "Casual Friday" at the MarkLogic User Conference. #mluc11</subject>
      <stamp>29-4-2011 19:42:43</stamp>
   </tweet>
   <tweet url="http://twitter.com/jclip/statuses/64021716304801792 ">
      <from>jclip (James Clippinger)</from>
      <subject>Enterprise data layer should bring together your data strategy and SOA strategy to make them both work @cdhayes at #MLUC11</subject>
      <stamp>29-4-2011 19:42:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/64020631993335810 ">
      <from>eedeebee (eedeebee)</from>
      <subject>RT @mdubinko: Next year's #MLUC is on the East Coast April 30 - May 3, 2012 #MLUC11 #MLUC12</subject>
      <stamp>29-4-2011 19:38:02</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64035237499375616 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>If you use #RDFa markup in your pages, you get more-informative search results. Huge benefit in a competitive market. #MLUC11</subject>
      <stamp>29-4-2011 20:36:04</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64034627047792640 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Long-tail search: To get past the vanishing-returns point, need greater understanding of the queries. #MLUC11</subject>
      <stamp>29-4-2011 20:33:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64034560505167872 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Hendler believes Google will look to semantics for long tail search #mluc11</subject>
      <stamp>29-4-2011 20:33:23</stamp>
   </tweet>
   <tweet url="http://twitter.com/yuxipacific/statuses/64034539911135232 ">
      <from>yuxipacific (Michael Puscar)</from>
      <subject>&gt; 3M "likes" on Facebook every day, each representing a discreet concept.  Deep potential there for association and classification #MLUC11</subject>
      <stamp>29-4-2011 20:33:18</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64033711884206080 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>http://bit.ly/m2f99l Jim Hendler stopped making slides re what is happening on the web, now references articles instead #mluc11</subject>
      <stamp>29-4-2011 20:30:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64033524969254912 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>XML alone not enough--needed a way to name something from another place. Need links to build a network. #MLUC11 #semtech</subject>
      <stamp>29-4-2011 20:29:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/jclip/statuses/64033261868953600 ">
      <from>jclip (James Clippinger)</from>
      <subject>Hey @kstirman, can we have the tech panel play the St. John's croquet team at #MLUC12?  #MLUC11 #petawickets</subject>
      <stamp>29-4-2011 20:28:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64033092863672320 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Open Graph Protocol, based on RDFa, lives comfortably in a #HTML5 document.  And then there were "Like" buttons. #MLUC11</subject>
      <stamp>29-4-2011 20:27:33</stamp>
   </tweet>
   <tweet url="http://twitter.com/jcurro/statuses/64032624733204480 ">
      <from>jcurro (Joseph A. Curro, Jr.)</from>
      <subject>DODS built Ixxus Publishing Connector to allow Alresco and MarkLogic to play together.   #mluc11</subject>
      <stamp>29-4-2011 20:25:42</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64032577962508288 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>2006-2007 Web Developers start to realize that semantic tech matters to them. (also, the #SearchMonkey era) Jim Hendler #MLUC11</subject>
      <stamp>29-4-2011 20:25:30</stamp>
   </tweet>
   <tweet url="http://twitter.com/jcurro/statuses/64032256624312320 ">
      <from>jcurro (Joseph A. Curro, Jr.)</from>
      <subject>DODS works with Alfresco, Solr/Lucene, MarkLogic integrations.   #mluc11</subject>
      <stamp>29-4-2011 20:24:14</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64032225607426048 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Jim Hendler's title is cool but more than 140 characters. Includes the word "tetherless". #mluc11</subject>
      <stamp>29-4-2011 20:24:06</stamp>
   </tweet>
   <tweet url="http://twitter.com/d3clan/statuses/64031907104559104 ">
      <from>d3clan (Declan Newman)</from>
      <subject>Jim Hendler  takes to the stage #mluc11</subject>
      <stamp>29-4-2011 20:22:50</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64031692167450625 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>At the semantic technology session - the reason I was willing to take a Friday night red eye. #mluc11</subject>
      <stamp>29-4-2011 20:21:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/d3clan/statuses/64031351493500928 ">
      <from>d3clan (Declan Newman)</from>
      <subject>@tonyhammond Semantic tech and MarkLogic just started #mluc11</subject>
      <stamp>29-4-2011 20:20:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/john_craft/statuses/64042157694140417 ">
      <from>john_craft (John Craft)</from>
      <subject>Michael Blakeley says disk IO not so good on EC2 #mluc11</subject>
      <stamp>29-4-2011 21:03:34</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64042046318587904 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Demo: #SPARQL code running inside of CQ. New "SPARQL" button to invoke. Results as XML. Cool! #MLUC11</subject>
      <stamp>29-4-2011 21:03:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/sagarbhujbal/statuses/64041451029405696 ">
      <from>sagarbhujbal (Sagar Bhujbal)</from>
      <subject>#DBPedia is the #wikipedia of the semantics. #mluc11</subject>
      <stamp>29-4-2011 21:00:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64041185186021376 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Now for the demo of SPARQL + XQuery + MarkLogic. #mluc11</subject>
      <stamp>29-4-2011 20:59:43</stamp>
   </tweet>
   <tweet url="http://twitter.com/gcarothers/statuses/64041117850677248 ">
      <from>gcarothers (Gavin Carothers)</from>
      <subject>RT @lisabos: Semantic web is here and real, mostly through RDFa and Linked-data. Not bleeding edge. - Jim Hendler #mluc11</subject>
      <stamp>29-4-2011 20:59:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64040634360659968 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Thinking about the web as both documents and links is a powerful POV. #MLUC11 #semtech</subject>
      <stamp>29-4-2011 20:57:31</stamp>
   </tweet>
   <tweet url="http://twitter.com/sagarbhujbal/statuses/64040591083835392 ">
      <from>sagarbhujbal (Sagar Bhujbal)</from>
      <subject>Semantic web is here &amp; cannot be ignored if you need to be in game few years from now. #mluc11</subject>
      <stamp>29-4-2011 20:57:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/hunterhacker/statuses/64040356278308864 ">
      <from>hunterhacker (Jason Hunter)</from>
      <subject>RT @mdubinko: Jason Hunter compares SSD revolution to climate change. More entrenched companies will have a harder time adapting. #MLUC11</subject>
      <stamp>29-4-2011 20:56:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64040250556678145 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Semantic web is here and real, mostly through RDFa and Linked-data. Not bleeding edge. - Jim Hendler #mluc11</subject>
      <stamp>29-4-2011 20:56:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64040210224250880 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Semantic Web is in real use today. Not "bleeding edge". Are you taking advantage of it? #MLUC11</subject>
      <stamp>29-4-2011 20:55:50</stamp>
   </tweet>
   <tweet url="http://twitter.com/tomstilwell/statuses/64039140957765632 ">
      <from>tomstilwell (Tom Stilwell)</from>
      <subject>RT @peteaven: agree!  RT @mdubinko Summary: amazing culture and work ethic at MarkLogic #MLUC11</subject>
      <stamp>29-4-2011 20:51:35</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64038834949718016 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>It has become easy to do rapid ad hoc querying, visualization of relationships among info with rdf on the web. #mluc11</subject>
      <stamp>29-4-2011 20:50:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64038200905187328 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Comparing GDP of US and China is a data integration problem: various sources, changing currency rates, population #MLUC11</subject>
      <stamp>29-4-2011 20:47:51</stamp>
   </tweet>
   <tweet url="http://twitter.com/sagarbhujbal/statuses/64037646472720384 ">
      <from>sagarbhujbal (Sagar Bhujbal)</from>
      <subject>Government Data sharing at www.data.gov uses now semantic web featured &gt;350K datasets #mluc11</subject>
      <stamp>29-4-2011 20:45:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64037607566348288 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>data.gov on a slide entitled "My favorite Applications" #MLUC11</subject>
      <stamp>29-4-2011 20:45:30</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64047081920266240 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>NASA using #SPARQL for interop of their databases. #MLUC11</subject>
      <stamp>29-4-2011 21:23:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64046190102183936 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Jim Hendler: SEO will drive the next few years of popular #semtech #MLUC11</subject>
      <stamp>29-4-2011 21:19:36</stamp>
   </tweet>
   <tweet url="http://twitter.com/hunterhacker/statuses/64045701629349888 ">
      <from>hunterhacker (Jason Hunter)</from>
      <subject>Go @bsletten! RT @lisabos: Best Buy embedded RDFa in their pages and increased click throughs by 30%. #mluc11</subject>
      <stamp>29-4-2011 21:17:39</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64045084622061568 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Linking between URIs needs to happen at infrastructure level, not bolt-on. #MLUC11</subject>
      <stamp>29-4-2011 21:15:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64044880682434560 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>Most SPARQL functions mapped easily to XQuery. #mluc11</subject>
      <stamp>29-4-2011 21:14:24</stamp>
   </tweet>
   <tweet url="http://twitter.com/hunterhacker/statuses/64043474336497664 ">
      <from>hunterhacker (Jason Hunter)</from>
      <subject>Cool! MarkLogic's CQ web IDE hacked to have a new run as SPARQL button. Open source add-on. #MLUC11  http://t.co/oDjLZxc</subject>
      <stamp>29-4-2011 21:08:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/64043324323012608 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>Triples as XML documents. Queries being machine transformed from SPARQL to XQuery. #MLUC11</subject>
      <stamp>29-4-2011 21:08:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/lisabos/statuses/64043211668205568 ">
      <from>lisabos (Lisa Bos)</from>
      <subject>In a couple days, crawled for NYT etc content, auto-converted some SPARQL queries to XQuery, ran in ML to find relationships. #mluc11</subject>
      <stamp>29-4-2011 21:07:46</stamp>
   </tweet>
   <tweet url="http://twitter.com/PhillyShopBuzz/statuses/64056214509719552 ">
      <from>PhillyShopBuzz (Philly Shop Buzz)</from>
      <subject>Best Buy is buzzing: http://sch.mp/0muHcM - RT @lisabos Best Buy embedded RDFa in their pages and increased click throughs by 30%. #mluc11</subject>
      <stamp>29-4-2011 21:59:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64054540713988096 ">
      <from>peteaven (peteaven)</from>
      <subject>Tha tha tha tha that's all folks! Thanks for another great user conference! #MLUC11</subject>
      <stamp>29-4-2011 21:52:47</stamp>
   </tweet>
   <tweet url="http://twitter.com/philipfennell/statuses/64054421507670016 ">
      <from>philipfennell (Philip Fennell)</from>
      <subject>RT @mdubinko: Parting tip for XQuery programmers: don't treat it like an imperative/procedural language. More Scheme than Java. #MLUC11</subject>
      <stamp>29-4-2011 21:52:18</stamp>
   </tweet>
   <tweet url="http://twitter.com/jclip/statuses/64073670196334592 ">
      <from>jclip (James Clippinger)</from>
      <subject>On my way to #SFO after a great time at #MLUC11.  Had an enlightening chat with @apprelevance before leaving</subject>
      <stamp>29-4-2011 23:08:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64085402503495682 ">
      <from>peteaven (peteaven)</from>
      <subject>Transcript &amp; pic from morning's #MLUC11 panel featuring #lindblad @chris_biow @hunterhacker @mathling @wfeick @kstirman http://bit.ly/iKwUfE</subject>
      <stamp>29-4-2011 23:55:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64083832013459458 ">
      <from>peteaven (peteaven)</from>
      <subject>this week #MLUC11, &amp; next week Thor in IMAX 3D!?! #shocks #pegs #lucky</subject>
      <stamp>29-4-2011 23:49:10</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64083256986959872 ">
      <from>peteaven (peteaven)</from>
      <subject>RT @tomstilwell : @kstirman rocked it as tech panel host #MLUC11 kept it light &amp; engaging. Can't wait for @MarkLogic brainiacs to finish 5.0</subject>
      <stamp>29-4-2011 23:46:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64083029538250752 ">
      <from>peteaven (peteaven)</from>
      <subject>RT @kwaxon MarkLogic: "We avoid doing work that doesn't need to be done." #mluc11</subject>
      <stamp>29-4-2011 23:45:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64094315927973888 ">
      <from>peteaven (peteaven)</from>
      <subject>RT @IBMWatson: @peteaven Hi, #ibmwatson #healthcare solution will have speech recognition http://bit.ly/f0jy0V #MLUC11</subject>
      <stamp>30-4-2011 0:30:50</stamp>
   </tweet>
   <tweet url="http://twitter.com/kashbadami/statuses/64103266107138048 ">
      <from>kashbadami (kashbadami)</from>
      <subject>RT @peteaven: RT @IBMWatson: @peteaven Hi, #ibmwatson #healthcare solution will have speech recognition http://bit.ly/f0jy0V #MLUC11</subject>
      <stamp>30-4-2011 1:06:24</stamp>
   </tweet>
   <tweet url="http://twitter.com/ibmwatsonbot/statuses/64102175424512000 ">
      <from>ibmwatsonbot (IBMWatson Bot)</from>
      <subject>RT #IBMWatson: #peteaven Hi, ibmwatson healthcare solution will have speech recognition http://bit.ly/f0jy0V MLUC11 http://dlvr.it/Q88c9</subject>
      <stamp>30-4-2011 1:02:04</stamp>
   </tweet>
   <tweet url="http://twitter.com/Fannieopa/statuses/64101508723113984 ">
      <from>Fannieopa (Fannie Osborne)</from>
      <subject>RT @lisabos: This talk is a summary of Jason's "Inside MarkLogic" white paper. #mluc11</subject>
      <stamp>30-4-2011 0:59:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/sagarbhujbal/statuses/64098978970607616 ">
      <from>sagarbhujbal (Sagar Bhujbal)</from>
      <subject>After 4 days at #marklogic user conf, it's time to say bye to SFO. Great experience hearing/meeting some great people.Feel energized #mluc11</subject>
      <stamp>30-4-2011 0:49:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/jasoncbooth/statuses/64117811949211648 ">
      <from>jasoncbooth (Jason Booth)</from>
      <subject>RT @peteaven: lindblad (on the speed of MarkLogic Server): it's fast because we're constantly working on it to be fast, we're never done. #MLUC11</subject>
      <stamp>30-4-2011 2:04:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/mich_woodside/statuses/64132840408891392 ">
      <from>mich_woodside (Michelle Woodside)</from>
      <subject>#MLUC11 was a terrific event!  So happy to be part of such a great organization.  @MarkLogic</subject>
      <stamp>30-4-2011 3:03:55</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/64132768807911425 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>The #mluc11 wrapped up earlier today.  Bought an anniversary gift for the missus.  Now it's time for an epic #GeekDinner.</subject>
      <stamp>30-4-2011 3:03:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/jahendler/statuses/64152630284398592 ">
      <from>jahendler (jahendler)</from>
      <subject>RT @lisabos: Semantic web is here and real, mostly through RDFa and Linked-data. Not bleeding edge. - Jim Hendler #mluc11</subject>
      <stamp>30-4-2011 4:22:33</stamp>
   </tweet>
   <tweet url="http://twitter.com/kev_burns/statuses/64150348960505857 ">
      <from>kev_burns (Kevin Burns)</from>
      <subject>Just back from #mluc11 - thanks to everyone @marklogic for putting on such a fantastic event!</subject>
      <stamp>30-4-2011 4:13:29</stamp>
   </tweet>
   <tweet url="http://twitter.com/jahendler/statuses/64157462206492672 ">
      <from>jahendler (jahendler)</from>
      <subject>RT @lisabos: http://bit.ly/m2f99l Jim Hendler stopped making slides re what is happening on the web, now references articles instead #mluc11</subject>
      <stamp>30-4-2011 4:41:45</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/64185822135595008 ">
      <from>dscape (Nuno Job)</from>
      <subject>Awesome picture from #mluc11 - http://bit.ly/kbX6SO</subject>
      <stamp>30-4-2011 6:34:27</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/64209016968060928 ">
      <from>dscape (Nuno Job)</from>
      <subject>@alanfischer85 ahaha - geeky stuff at the marklogic developer lounge #mluc11 :)</subject>
      <stamp>30-4-2011 8:06:37</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/64285312234434560 ">
      <from>peteaven (peteaven)</from>
      <subject>only 364 more coding days til #MLUC12! thinking of what I should create next /cc: #MLUC11</subject>
      <stamp>30-4-2011 13:09:47</stamp>
   </tweet>
   <tweet url="http://twitter.com/kashbadami/statuses/64288777044111360 ">
      <from>kashbadami (kashbadami)</from>
      <subject>RT @hunterhacker: Cool! MarkLogic's CQ web IDE hacked to have a new run as SPARQL button. Open source add-on. #MLUC11  http://t.co/oDjLZxc</subject>
      <stamp>30-4-2011 13:23:33</stamp>
   </tweet>
   <tweet url="http://twitter.com/kashbadami/statuses/64287650420494337 ">
      <from>kashbadami (kashbadami)</from>
      <subject>RT @peteaven: agree!  RT @mdubinko Summary: amazing culture and work ethic at MarkLogic #MLUC11</subject>
      <stamp>30-4-2011 13:19:04</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/64308831727001600 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>RT @dscape: Awesome picture from #mluc11 - http://bit.ly/kbX6SO</subject>
      <stamp>30-4-2011 14:43:14</stamp>
   </tweet>
   <tweet url="http://twitter.com/leepollington/statuses/64318761859162112 ">
      <from>leepollington (Lee Pollington)</from>
      <subject>RT @eedeebee: RT @mdubinko: Next year's #MLUC is on the East Coast April 30 - May 3, 2012 #MLUC11 #MLUC12</subject>
      <stamp>30-4-2011 15:22:42</stamp>
   </tweet>
   <tweet url="http://twitter.com/joedalton1730/statuses/64328345181106176 ">
      <from>joedalton1730 (Joe Dalton)</from>
      <subject>Thanks to everyone who attended MLUC11. Great stuff. Already thinking about next year.</subject>
      <stamp>30-4-2011 16:00:47</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/64353461189353472 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @mdubinko: Next year's #MLUC is on the East Coast April 30 - May 3, 2012 #MLUC11 #MLUC12</subject>
      <stamp>30-4-2011 17:40:35</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/64353430608678912 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @peteaven: lindblad (on the speed of MarkLogic Server): it's fast because we're constantly working on it to be fast, we're never done. #MLUC11</subject>
      <stamp>30-4-2011 17:40:28</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/64352729090371584 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @mdubinko: Jason Hunter compares SSD revolution to climate change. More entrenched companies will have a harder time adapting. #MLUC11</subject>
      <stamp>30-4-2011 17:37:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/64352163220037632 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @mdubinko: Kelly asks "How could we do an IBM Watson in MarkLogic?" #MLUC11</subject>
      <stamp>30-4-2011 17:35:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/64351804061777920 ">
      <from>Grtjn (Geert)</from>
      <subject>+1 RT @mdubinko @hunterhacker excited multi-statement transactions. Oft-requested feature, useful in multi-step transformations. #MLUC11</subject>
      <stamp>30-4-2011 17:34:00</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/64737670215110656 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>One thing I regret about #mluc11 week in California: I didn't do In-N-Out while here.  #notaeuphamism</subject>
      <stamp>1-5-2011 19:07:18</stamp>
   </tweet>
   <tweet url="http://twitter.com/apprelevance/statuses/64475725025124352 ">
      <from>apprelevance (Applied Relevance)</from>
      <subject>Turns out people really need easy to use taxonomy management software.  Who knew?   #MLUC11 #marklogic #taxonomy</subject>
      <stamp>1-5-2011 1:46:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/StephenBuxton/statuses/64403048927199232 ">
      <from>StephenBuxton (stephen buxton)</from>
      <subject>Enjoyed Jim Hendlers talk  #MLUC11. Who knew you could use MarkLogic as a doc store (XML) AND a link data store (RDF) and query across both?</subject>
      <stamp>30-4-2011 20:57:38</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/64402888608329728 ">
      <from>xquery (james fuller)</from>
      <subject>RT @StephenBuxton: Unwinding post #MLUC11. Around 80 talks. Developers Lounge was a huge success (kudos to #eedeebee). Our customers and partners are amazing!</subject>
      <stamp>30-4-2011 20:56:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/StephenBuxton/statuses/64402095255715840 ">
      <from>StephenBuxton (stephen buxton)</from>
      <subject>Unwinding post #MLUC11. Around 80 talks. Developers Lounge was a huge success (kudos to #eedeebee). Our customers and partners are amazing!</subject>
      <stamp>30-4-2011 20:53:50</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/64391383141720064 ">
      <from>xquery (james fuller)</from>
      <subject>just got home from #MLUC11 ... great time, lots of food for thought and good ideas to 'kill off'!</subject>
      <stamp>30-4-2011 20:11:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/64354605865250816 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @mdubinko: If you use #RDFa markup in your pages, you get more-informative search results. Huge benefit in a competitive market. #MLUC11</subject>
      <stamp>30-4-2011 17:45:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/64354546629099520 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @mdubinko: XML alone not enough--needed a way to name something from another place. Need links to build a network. #MLUC11 #semtech</subject>
      <stamp>30-4-2011 17:44:54</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/65052009383997440 ">
      <from>Grtjn (Geert)</from>
      <subject>For those who missed out on #MLUC11, lots of interesting material on http://newsletter.marklogic.com/2011/04/live-from-mluc11/</subject>
      <stamp>2-5-2011 15:56:22</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/65063704072425472 ">
      <from>Grtjn (Geert)</from>
      <subject>Thanks to all who tweeted about #MLUC11, felt like I didn't miss a thing. @mdubinko I think you have been retweeded most, congrats ;)</subject>
      <stamp>2-5-2011 16:42:50</stamp>
   </tweet>
   <tweet url="http://twitter.com/mdubinko/statuses/65097742480969728 ">
      <from>mdubinko (Micah Dubinko)</from>
      <subject>You know what was the best thing about the #MLUC11 venue? Not a single complaint about wi-fi all week. Nicely done, Palace Hotel.</subject>
      <stamp>2-5-2011 18:58:05</stamp>
   </tweet>
   <tweet url="http://twitter.com/JustSystems/statuses/65430551863099392 ">
      <from>JustSystems (JustSystems)</from>
      <subject>Great to see everyone at #MLUC11 last week! For more info, follow @JustSystems and LIKE us http://ow.ly/4Lp5H #marklogic #techcomm #xml</subject>
      <stamp>3-5-2011 17:00:33</stamp>
   </tweet>
   <tweet url="http://twitter.com/headhuntersbiz/statuses/65622030476771328 ">
      <from>headhuntersbiz (headhuntersbiz)</from>
      <subject>RT @cognizant: Meet us at Kiosk 3 at MarkLogic User’s Conference #MLUC11 http://bit.ly/hQl0aJ</subject>
      <stamp>4-5-2011 5:41:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/ronhitchens/statuses/65850281379893249 ">
      <from>ronhitchens (Ron Hitchens)</from>
      <subject>RT @peteaven: #doubledoseofawesome @ronhitchens &amp; ann smith at #MLUC11 reception http://twitpic.com/4tca4z</subject>
      <stamp>4-5-2011 20:48:25</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/65835859370455040 ">
      <from>peteaven (peteaven)</from>
      <subject>Doc dominator Danny w/ @dborkar and @stephenbuxton at #MLUC11 reception http://twitpic.com/4tcghu</subject>
      <stamp>4-5-2011 19:51:06</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/65833874139258880 ">
      <from>peteaven (peteaven)</from>
      <subject>#MLUC11 talkin failover with @wfeick and @jpcs http://twitpic.com/4tcdgg</subject>
      <stamp>4-5-2011 19:43:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/65831653028798464 ">
      <from>peteaven (peteaven)</from>
      <subject>#doubledoseofawesome @ronhitchens &amp; ann smith at #MLUC11 reception http://twitpic.com/4tca4z</subject>
      <stamp>4-5-2011 19:34:23</stamp>
   </tweet>
   <tweet url="http://twitter.com/ggheorghiu/statuses/65829425975001089 ">
      <from>ggheorghiu (Gabriel Gheorghiu)</from>
      <subject>RT @Grtjn: For those who missed out on #MLUC11, lots of interesting material on http://newsletter.marklogic.com/2011/04/live-from-mluc11/</subject>
      <stamp>4-5-2011 19:25:32</stamp>
   </tweet>
   <tweet url="http://twitter.com/ESeanSweeney/statuses/66122441545629696 ">
      <from>ESeanSweeney (ESeanSweeney)</from>
      <subject>Busy day today with lots of follow-ups from london book fair and marklogic user conference. #lbf11, #mluc11 http://myloc.me/jLOsK</subject>
      <stamp>5-5-2011 14:49:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/edCetraTraining/statuses/66301024343822336 ">
      <from>edCetraTraining (edCetra Training)</from>
      <subject>Reuben Tozman also from #edcetratraining. Was at an incredible conference last week #MLUC11 and learned about 'Bigdata' #lrnchat</subject>
      <stamp>6-5-2011 2:39:30</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquerywebappdev/statuses/66898898718949376 ">
      <from>xquerywebappdev (XQuery Web App Dev)</from>
      <subject>6 Things I Learned at the 2011 MarkLogic User Conference http://bit.ly/jNWocA #mluc11</subject>
      <stamp>7-5-2011 18:15:15</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/67382400933560320 ">
      <from>peteaven (peteaven)</from>
      <subject>MarkLogic User Conference 2011 Impressions http://bit.ly/lVwdw6 #MLUC11</subject>
      <stamp>9-5-2011 2:16:30</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/67384898704519168 ">
      <from>peteaven (peteaven)</from>
      <subject>@xquerywebappdev great to see you at #MLUC11 &amp; looking forward to the book!</subject>
      <stamp>9-5-2011 2:26:26</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/67384738972844032 ">
      <from>peteaven (peteaven)</from>
      <subject>6 Things I Learned at the 2011 MarkLogic User Conference http://bit.ly/jNWocA #mluc11 RT @xquerywebappdev</subject>
      <stamp>9-5-2011 2:25:48</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/67490324645289985 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @peteaven: 6 Things I Learned at the 2011 MarkLogic User Conference http://bit.ly/jNWocA #mluc11 RT @xquerywebappdev</subject>
      <stamp>9-5-2011 9:25:21</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/67490222245548034 ">
      <from>Grtjn (Geert)</from>
      <subject>RT @peteaven: MarkLogic User Conference 2011 Impressions http://bit.ly/lVwdw6 #MLUC11</subject>
      <stamp>9-5-2011 9:24:57</stamp>
   </tweet>
   <tweet url="http://twitter.com/SethGrimes/statuses/67730822823809025 ">
      <from>SethGrimes (Seth Grimes)</from>
      <subject>There's a certain irony in the top @MarkLogic user conference photo at http://bit.ly/lA5v9Y #MLUC11 I may cover it tomorrow.</subject>
      <stamp>10-5-2011 1:21:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/68123459347156992 ">
      <from>eedeebee (eedeebee)</from>
      <subject>RT @xquerywebappdev: 6 Things I Learned at the 2011 MarkLogic User Conference http://bit.ly/jNWocA #mluc11</subject>
      <stamp>11-5-2011 3:21:13</stamp>
   </tweet>
   <tweet url="http://twitter.com/xquery/statuses/68377792080920576 ">
      <from>xquery (james fuller)</from>
      <subject>RT @evanlenz: MarkLogic Dev Lounge slides now available: http://bit.ly/hJMTL0 Including my own preso on how we use XSLT: http://bit.ly/l28Jlj (PDF)</subject>
      <stamp>11-5-2011 20:11:50</stamp>
   </tweet>
   <tweet url="http://twitter.com/evanlenz/statuses/68375617866960896 ">
      <from>evanlenz (Evan Lenz)</from>
      <subject>MarkLogic Dev Lounge slides now available: http://bit.ly/hJMTL0 Including my own preso on how we use XSLT: http://bit.ly/l28Jlj (PDF)</subject>
      <stamp>11-5-2011 20:03:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/dscape/statuses/68391920140955648 ">
      <from>dscape (Nuno Job)</from>
      <subject>RT @evanlenz: MarkLogic Dev Lounge slides now available: http://bit.ly/hJMTL0 Including my own preso on how we use XSLT: http://bit.ly/l28Jlj (PDF)</subject>
      <stamp>11-5-2011 21:07:59</stamp>
   </tweet>
   <tweet url="http://twitter.com/Lucy_viega/statuses/68386959755714560 ">
      <from>Lucy_viega (Geert)</from>
      <subject>RT @evanlenz: MarkLogic Dev Lounge slides now available: http://bit.ly/hJMTL0 Including my own preso on how we use XSLT: http://bit.ly/l28Jlj (PDF)</subject>
      <stamp>11-5-2011 20:48:16</stamp>
   </tweet>
   <tweet url="http://twitter.com/danja/statuses/68386358934253568 ">
      <from>danja (Danny Ayers)</from>
      <subject>RT @evanlenz: MarkLogic Dev Lounge slides now available: http://bit.ly/hJMTL0 Including my own preso on how we use XSLT: http://bit.ly/l28Jlj (PDF)</subject>
      <stamp>11-5-2011 20:45:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/smyles/statuses/68385877730131968 ">
      <from>smyles (Stuart Myles)</from>
      <subject>RT @evanlenz: MarkLogic Dev Lounge slides now available: http://bit.ly/hJMTL0 Including my own preso on how we use XSLT: http://bit.ly/l28Jlj (PDF)</subject>
      <stamp>11-5-2011 20:43:58</stamp>
   </tweet>
   <tweet url="http://twitter.com/RRHMLS/statuses/70097579718881280 ">
      <from>RRHMLS (Ralph Russo)</from>
      <subject>TheIndpndnt: http://ind.pn/mluC11 - World shipping leaders (thru IMO) urged by SAMI  to co-ordinate fight against piracy better - #TranSec</subject>
      <stamp>16-5-2011 14:05:40</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/70562482577604609 ">
      <from>peteaven (peteaven)</from>
      <subject>Keepin #MLUC11 alive on the twitters!</subject>
      <stamp>17-5-2011 20:53:01</stamp>
   </tweet>
   <tweet url="http://twitter.com/scottabel/statuses/75573626958659585 ">
      <from>scottabel (Scott Abel)</from>
      <subject>RT @evanlenz MarkLogic Dev Lounge slides now available http://dlvr.it/Tc3N7 Including presentation on using XSLT: http://dlvr.it/Tc3NS (PDF)</subject>
      <stamp>31-5-2011 16:45:31</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/75685410914828288 ">
      <from>Grtjn (Geert)</from>
      <subject>Has anyone harvested tweets mentioning mluc11? I am lacking those from before april 15th. Twitter search doesn't return them anymore..</subject>
      <stamp>1-6-2011 0:09:42</stamp>
   </tweet>
   <tweet url="http://twitter.com/peteaven/statuses/75963238872924162 ">
      <from>peteaven (peteaven)</from>
      <subject>new blog post: MarkLogic User Conference 2011 Reloaded http://bit.ly/jcpOLM #MLUC11</subject>
      <stamp>1-6-2011 18:33:42</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/75971701904646145 ">
      <from>Grtjn (Geert)</from>
      <subject>@peteaven Just to mention, I've harvested roughly 300 tweets mentioning mluc11. I'd be happy to share them, somehow..</subject>
      <stamp>1-6-2011 19:07:19</stamp>
   </tweet>
   <tweet url="http://twitter.com/aprilandjake/statuses/75979706763186176 ">
      <from>aprilandjake (aprilandjake)</from>
      <subject>RT @peteaven: new blog post: MarkLogic User Conference 2011 Reloaded http://bit.ly/jcpOLM #MLUC11</subject>
      <stamp>1-6-2011 19:39:08</stamp>
   </tweet>
   <tweet url="http://twitter.com/evanlenz/statuses/75976122600407040 ">
      <from>evanlenz (Evan Lenz)</from>
      <subject>RT @peteaven: new blog post: MarkLogic User Conference 2011 Reloaded http://bit.ly/jcpOLM #MLUC11</subject>
      <stamp>1-6-2011 19:24:53</stamp>
   </tweet>
   <tweet url="http://twitter.com/joewiz/statuses/75980479756648448 ">
      <from>joewiz (Joe Wicentowski)</from>
      <subject>RT @evanlenz: MarkLogic Dev Lounge slides now available: http://bit.ly/hJMTL0 Including my own preso on how we use XSLT: http://bit.ly/l28Jlj (PDF)</subject>
      <stamp>1-6-2011 19:42:12</stamp>
   </tweet>
   <tweet url="http://twitter.com/eedeebee/statuses/76010019803508736 ">
      <from>eedeebee (eedeebee)</from>
      <subject>RT @peteaven: new blog post: MarkLogic User Conference 2011 Reloaded http://bit.ly/jcpOLM #MLUC11</subject>
      <stamp>1-6-2011 21:39:35</stamp>
   </tweet>
   <tweet url="http://twitter.com/jfix/statuses/76057315035451392 ">
      <from>jfix (Jakob Fix)</from>
      <subject>RT @evanlenz: MarkLogic Dev Lounge slides now available: http://bit.ly/hJMTL0 Including my own preso on how we use XSLT: http://bit.ly/l28Jlj (PDF)</subject>
      <stamp>2-6-2011 0:47:31</stamp>
   </tweet>
   <tweet url="http://twitter.com/Grtjn/statuses/77971222582919168 ">
      <from>Grtjn (Geert)</from>
      <subject>Nice preso why XQuery is Awesome, missed that before! #mluc11 http://www.slideshare.net/pbokelly/mluc-2011-xquery-enigma</subject>
      <stamp>7-6-2011 7:32:42</stamp>
   </tweet>
</tweets>;

declare variable $url-lookup :=
map:map(
<map:map xmlns:map="http://marklogic.com/xdmp/map" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<map:entry key="http://t.co/lUvfwC9">
	  <map:value>http://yfrog.com/h37gzsej</map:value>
	</map:entry>
	<map:entry key="http://t.co/AJUp3gD">
	  <map:value>http://www.amazon.com/Mastering-Data-Modeling-User-Driven-Approach/dp/020170045X</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/fYFvpo">
	  <map:value>http://blogs.marklogic.com/2011/04/15/followanyday-mluc11-developer-lounge-labs</map:value>
	</map:entry>
	<map:entry key="http://twitpic.com/4q765i">
	  <map:value xsi:type="xs:string">http://twitpic.com/4q765i</map:value>
	</map:entry>
	<map:entry key="http://yfrog.com/gzoz0ipj">
	  <map:value xsi:type="xs:string">http://yfrog.com/gzoz0ipj</map:value>
	</map:entry>
	<map:entry key="http://t.co/VLarmB7">
	  <map:value>http://yfrog.com/hs6pbycfj</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/hQl0aJ">
	  <map:value>http://www.cognizant.com/news/events?SortType=SortDate&amp;SortOrder=asc&amp;PageNo=2&amp;Value=All</map:value>
	</map:entry>
	<map:entry key="http://twitpic.com/4q77ya">
	  <map:value xsi:type="xs:string">http://twitpic.com/4q77ya</map:value>
	</map:entry>
	<map:entry key="http://t.co/CZp17za">
	  <map:value>https://github.com/jtsnake/xquery-suez</map:value>
	</map:entry>
	<map:entry key="http://t.co/oDjLZxc">
	  <map:value>http://twitpic.com/4r3f8e</map:value>
	</map:entry>
	<map:entry key="http://twitpic.com/4q7hwj">
	  <map:value xsi:type="xs:string">http://twitpic.com/4q7hwj</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/gUVWRL">
	  <map:value>http://blogs.marklogic.com/2011/04/15/followanyday-mluc11-developer-lounge-labs/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/nsql-hackers">
	  <map:value>http://mluc11-insidehack.eventbrite.com/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/jcpOLM">
	  <map:value>http://blogs.marklogic.com/2011/06/01/marklogic-user-conference-2011-reloaded/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/hp5iJ1">
	  <map:value>http://www.marklogicevents.com/?event=content.home</map:value>
	</map:entry>
	<map:entry key="http://j.mp/kanV5S">
	  <map:value>https://profiles.google.com/jblossom/posts/bR3CfZp4sFV</map:value>
	</map:entry>
	<map:entry key="http://mluc11.marklogic.com…">
	  <map:value xsi:type="xs:string">http://mluc11.marklogic.com/</map:value>
	</map:entry>
	<map:entry key="http://dlvr.it/Tc3N7">
	  <map:value>http://developer.marklogic.com/events/mluc11-labs-and-lounge-schedule#talks</map:value>
	</map:entry>
	<map:entry key="http://developer.marklogic.com/code/active-document">
	  <map:value xsi:type="xs:string">http://developer.marklogic.com/code/active-document</map:value>
	</map:entry>
	<map:entry key="http://ow.ly/4GLpb">
	  <map:value>http://www.linkedin.com/groups?mostPopular=&amp;gid=3712888&amp;trk=myg_ugrp_ovr</map:value>
	</map:entry>
	<map:entry key="http://dlvr.it/Q88c9">
	  <map:value>http://twitter.com/peteaven/statuses/64094315927973888</map:value>
	</map:entry>
	<map:entry key="http://icio.us/o8eozn">
	  <map:value>http://www.marklogicevents.com/?event=content.breakouts1#1b</map:value>
	</map:entry>
	<map:entry key="http://4sq.com/h2eB8i">
	  <map:value>https://foursquare.com/mattlyles/checkin/4db7605993a096e4f5dfe49a?s=ityC9fFgWf5J2wKzO3sPOhCYXuM</map:value>
	</map:entry>
	<map:entry key="http://yfrog.com/gyog4zvuj">
	  <map:value xsi:type="xs:string">http://yfrog.com/gyog4zvuj</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/dev-lounge">
	  <map:value>http://developer.marklogic.com/events/mluc11-labs-and-lounge-schedule?go=yes</map:value>
	</map:entry>
	<map:entry key="http://t.co/tUTIWbq">
	  <map:value>http://www.pragprog.com/titles/xquery/getting-started-with-xquery</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/eoUlcH">
	  <map:value>http://www.marklogicevents.com/?event=content.training</map:value>
	</map:entry>
	<map:entry key="http://myloc.me/jLOsK">
	  <map:value>http://myloc.me/mobile.php?id=jLOsK</map:value>
	</map:entry>
	<map:entry key="http://twitpic.com/4tcdgg">
	  <map:value xsi:type="xs:string">http://twitpic.com/4tcdgg</map:value>
	</map:entry>
	<map:entry key="http://t.co/Mx0No0b">
	  <map:value>http://yfrog.com/gzkjkyxj</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/dNLwYK">
	  <map:value>http://www.marklogicevents.com/?event=content.agenda</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/lVwdw6">
	  <map:value>http://rockycode.com/blog/marklogic-users-conference-2011-impressions/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/gQtzDI">
	  <map:value>http://maps.google.co.uk/maps/ms?ie=UTF8&amp;hl=en&amp;msa=0&amp;msid=210810948551946603295.0004a1c11df78c4ce83d8&amp;ll=37.790455,-122.39778&amp;spn=0.019636,0.045447&amp;z=15</map:value>
	</map:entry>
	<map:entry key="http://t.co/dlDR7oc">
	  <map:value>http://www.amazon.com/Querying-XML-context-Kaufmann-Management/dp/1558607110/</map:value>
	</map:entry>
	<map:entry key="http://tinyurl.com/3suh28z">
	  <map:value>http://www.marklogicevents.com/?event=content.breakouts3</map:value>
	</map:entry>
	<map:entry key="http://j.mp/gMJHMm">
	  <map:value>https://profiles.google.com/jblossom/posts/h1x4dwd3EpJ</map:value>
	</map:entry>
	<map:entry key="http://www.marklogicevents.com/">
	  <map:value xsi:type="xs:string">http://www.marklogicevents.com/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/m2f99l">
	  <map:value>http://cacm.acm.org/news/96941-google-twitter-and-facebook-build-the-semantic-web/fulltext</map:value>
	</map:entry>
	<map:entry key="http://sch.mp/0muHcM">
	  <map:value>http://philadelphia.schmap.com/shopping/best_buy?t=0muHcM</map:value>
	</map:entry>
	<map:entry key="http://t.co/cKOU11D">
	  <map:value>http://yfrog.com/h0mtepbj</map:value>
	</map:entry>
	<map:entry key="http://t.co/9lpmGdZ">
	  <map:value>http://markmail.org/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/lA5v9Y">
	  <map:value>http://newsletter.marklogic.com/2011/04/ken-bado-marklogic-ceos-keynote-shows-how-marklogic-customers-imagine-invent-and-inspire-innovation/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/iKwUfE">
	  <map:value>http://twitter.com/jblossom/statuses/64012111906471937</map:value>
	</map:entry>
	<map:entry key="http://ow.ly/4Lp5H">
	  <map:value>http://www.facebook.com/JustSystems</map:value>
	</map:entry>
	<map:entry key="http://j.mp/kulNMw">
	  <map:value>https://profiles.google.com/jblossom/posts/gqosMmddi66</map:value>
	</map:entry>
	<map:entry key="http://t.co/hKA8EfA">
	  <map:value>http://developer.marklogic.com/events/mluc11-labs-and-lounge-schedule</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/gJ26U3">
	  <map:value>http://www.marklogicevents.com/?event=content.breakouts3</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/lQsFUg">
	  <map:value>http://developer.marklogic.com/inside-marklogic</map:value>
	</map:entry>
	<map:entry key="http://t.co/H1s70Up">
	  <map:value>http://www.alistapart.com/articles/design-patterns-faceted-navigation/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/l28Jlj">
	  <map:value>http://developer.marklogic.com/media/mluc11-talks/XSLT-basedWebsitesOnMarkLogic.pdf</map:value>
	</map:entry>
	<map:entry key="http://ind.pn/mluC11">
	  <map:value>http://www.independent.co.uk/news/world/politics/leaders-urged-to-coordinate-against-piracy-threat-2284820.html</map:value>
	</map:entry>
	<map:entry key="http://t.co/efKYmHT">
	  <map:value>http://yfrog.com/h2xu0cmj</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/hJMTL0">
	  <map:value>http://developer.marklogic.com/events/mluc11-labs-and-lounge-schedule#talks</map:value>
	</map:entry>
	<map:entry key="http://j.mp/kW9AtU">
	  <map:value>https://profiles.google.com/jblossom/posts/Zr6BAkmzQJe</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/dFhnJa">
	  <map:value>http://blogs.marklogic.com/2011/04/15/followanyday-mluc11-developer-lounge-labs/</map:value>
	</map:entry>
	<map:entry key="http://deck.ly/~rXHwk">
	  <map:value>http://www.tweetdeck.com/twitter/mstrohlein/~rXHwk</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/f0jy0V">
	  <map:value>http://www.eweek.com/c/a/Health-Care-IT/IBM-Nuance-to-Tune-Watson-Supercomputer-for-Use-in-Health-Care-493127/</map:value>
	</map:entry>
	<map:entry key="http://t.co/udK1i2J">
	  <map:value>http://bobsutton.typepad.com/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/hKVDwI">
	  <map:value>http://newsletter.marklogic.com/2011/04/live-from-mluc11/</map:value>
	</map:entry>
	<map:entry key="http://twitpic.com/4tcghu">
	  <map:value xsi:type="xs:string">http://twitpic.com/4tcghu</map:value>
	</map:entry>
	<map:entry key="http://dlvr.it/Tc3NS">
	  <map:value>http://bit.ly/l28Jlj</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/fX4mYv">
	  <map:value>https://picasaweb.google.com/lee.pollington/MLUC11#5599533994421834018</map:value>
	</map:entry>
	<map:entry key="http://mluc11-insidehack.eventbrite.com">
	  <map:value xsi:type="xs:string">http://mluc11-insidehack.eventbrite.com/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/i1pMqX">
	  <map:value>https://github.com/isubiker/mljson</map:value>
	</map:entry>
	<map:entry key="http://plixi.com/p/96319957">
	  <map:value>http://lockerz.com/s/96319957</map:value>
	</map:entry>
	<map:entry key="http://tinyurl.com/3jnlp5z">
	  <map:value>http://blogs.marklogic.com/2011/04/15/followanyday-mluc11-developer-lounge-labs/</map:value>
	</map:entry>
	<map:entry key="http://4sq.com/gXGK50">
	  <map:value>https://foursquare.com/hiteshc1/checkin/4db7b7bffa8c377d83aee448?s=im0dk3_sFVovRzYo_9oEh0Gdzm4</map:value>
	</map:entry>
	<map:entry key="http://twitpic.com/4tca4z">
	  <map:value xsi:type="xs:string">http://twitpic.com/4tca4z</map:value>
	</map:entry>
	<map:entry key="http://newsletter.marklogic.com/2011/04/live-from-mluc11/">
	  <map:value xsi:type="xs:string">http://newsletter.marklogic.com/2011/04/live-from-mluc11/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/mSQ7n8">
	  <map:value>http://newsletter.marklogic.com/2011/04/video-marklogic-ceo-ken-bado-opens-the-2011-user-conference/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/jNWocA">
	  <map:value>http://xquerywebappdev.wordpress.com/2011/05/07/6-things-i-learned-at-the-2011-marklogic-user-conference/</map:value>
	</map:entry>
	<map:entry key="http://mluc11-insidehack.eventbrite.com/">
	  <map:value xsi:type="xs:string">http://mluc11-insidehack.eventbrite.com/</map:value>
	</map:entry>
	<map:entry key="http://j.mp/lSR8oE">
	  <map:value>https://profiles.google.com/jblossom/posts/RePfC6nZNJZ</map:value>
	</map:entry>
	<map:entry key="http://linkd.in/he82vA">
	  <map:value>http://www.linkedin.com/groups?mostPopular=&amp;gid=3712888&amp;trk=myg_ugrp_ovr</map:value>
	</map:entry>
	<map:entry key="http://deck.ly/~DaXUG">
	  <map:value>http://www.tweetdeck.com/twitter/leepollington/~DaXUG</map:value>
	</map:entry>
	<map:entry key="http://4sq.com/mKl9lS">
	  <map:value>https://foursquare.com/mattlyles/checkin/4dbab3b7a86ede8c0fa00f64?s=-dWzId3BcRD8Ix846AoFEEp7Q4U</map:value>
	</map:entry>
	<map:entry key="http://mluc11.marklogic.com/">
	  <map:value xsi:type="xs:string">http://mluc11.marklogic.com/</map:value>
	</map:entry>
	<map:entry key="http://bit.ly/kbX6SO">
	  <map:value>http://www.flickr.com/photos/marklogicuc/5662202267/sizes/l/in/set-72157626590824242/</map:value>
	</map:entry>
	<map:entry key="http://www.slideshare.net/pbokelly/mluc-2011-xquery-enigma">
	  <map:value xsi:type="xs:string">http://www.slideshare.net/pbokelly/mluc-2011-xquery-enigma</map:value>
	</map:entry>
</map:map>);

declare variable $new-lookup := map:map();

declare function local:resolve-url(
	$short-url as xs:string
)
	as xs:string?
{
	let $url := map:get($url-lookup, $short-url)
	return
		if (exists($url)) then
			$url
		else
			let $url := (try { xdmp:http-get($short-url)//*:location/text() } catch ($ignore) { () }, $short-url)[1]
			let $put := map:put($url-lookup, $short-url, $url)
			let $put := map:put($new-lookup, $short-url, $url)
			return
				$url
};

declare function local:message-to-html(
	$message as item()*
)
	as item()*
{
	for $n in $message
	return
		typeswitch ($n)
		case element(url)
			return <a href="{$n/@full}" alt="{$n/@long}" target="_blank">{data($n/@long)}</a>
		case element(tag)
			return <a href="http://twitter.com/#!/search/%23{$n/@id}" target="_blank">{$n/node()}</a>
		case element(user)
			return <a href="http://twitter.com/{$n/@id}" target="_blank">{$n/node()}</a>
		default
			return $n
};

xdmp:set-response-content-type("text/html"),

(: Apply some enrichment of the tweet data first :)
let $tweets :=
	<tweets>{
		for $t in $tweets/tweet
		
		let $user-id := lower-case(replace($t/from, '^([^ \(]+) \(([^\)]+)\)', '$1'))
		let $user-name := replace($t/from, '^([^ \(]+) \(([^\)]+)\)', '$2')
		
		let $enriched-subject :=
			for $x in fn:analyze-string($t/subject, 'http://[^ ,]+')/*
			return
				if ($x/self::*:match) then
					let $full-url := local:resolve-url($x/text())
					let $long-url := if (contains($full-url, '?')) then substring-before($full-url, '?') else $full-url
					return
						<url full="{$full-url}" long="{$long-url}" org="{$x/text()}">{$long-url}</url>
				else
					for $y in fn:analyze-string($x/text(), "#[^ \.,!;:']+")/*
					let $tag := lower-case(substring-after($y/text(), '#'))
					return
						if ($y/self::*:match) then
							<tag id="{$tag}">{$y/text()}</tag>
						else
							for $z in fn:analyze-string($y/text(), '@[a-zA-Z0-9_]+')/*
							let $id := lower-case(substring-after($z/text(), '@'))
							return
								if ($z/self::*:match) then
									<user id="{$id}">{$z/text()}</user>
								else
									$z/text()
		let $org-subject := string-join($enriched-subject, '')
		let $org-subject := if (matches($org-subject, '(RT|RSS) @')) then replace($org-subject, '^.*(RT|RSS) @[a-zA-Z0-9_]+:?\s+(.*)$', '$2') else $org-subject
		let $subject :=
			<subject org="{$org-subject}">{
				$enriched-subject
			}</subject>
		
		let $stamp := replace($t/stamp, '^(\d)-(\d+)-', '0$1-$2-') 
		let $stamp := replace($stamp, '^(\d+)-(\d)-', '$1-0$2-') 
		let $stamp := replace($stamp, ' (\d):', ' 0$1:')
		let $stamp := replace($stamp, '^(\d+)-(\d+)-(\d+) (\d+:\d+:\d+)$', '$3-$2-$1T$4Z')
		
		order by xs:dateTime($stamp)
		
		return
			element {
				'tweet'
			}
			{
				$t/@*,
				$t/node()[. except ($t/from, $t/stamp, $t/subject)],
				<from id="{$user-id}" name="{$user-name}">{ $t/from/text() }</from>,
				$subject,
				<stamp>{ $stamp }</stamp>
			}
	}</tweets>
	
(: Apply classification to be able to distinguish different kinds of tweets easier later on :)
let $tweets :=
	<tweets>{
		for $t in $tweets/tweet
		let $is-retweet := matches($t/subject, '^(RT|RSS) ')
		let $is-commented-retweet := matches($t/subject, ' (RT|RSS) ')
		let $is-reply := matches($t/subject, '^@')
		let $is-duplicate := count($tweets/tweet[$t >> .][subject eq $t/subject]) > 0

		let $contains-mentions :=
			matches(
				replace(
					replace($t/subject, '(RT|RSS) @', 'RT '),
					'^@[^ ]+ (@[^ ]+ )+', ''
				),
				' @'
			)
		return
			element {
				if ($is-retweet) then
					'retweet'
				else if ($is-commented-retweet) then
					'comment'
				else if ($is-reply) then
					'reply'
				else if ($is-duplicate) then
					'duplicate'
				else
					'tweet'
			}
			{
				if ($contains-mentions) then
					attribute contains-mentions { 'true' }
				else (),
				$t/@*,
				$t/node()
			}
	}</tweets>
	

(: gather unique values :)
let $users := distinct-values($tweets/*/(from/@id | subject/user/@id))
let $urls := distinct-values($tweets/*/subject/url/@full)
let $tags := distinct-values($tweets/*[subject/tag/@id != 'mluc11']/string-join(for $i in subject/tag/@id[. != 'mluc11'] order by $i return $i, "+"))
let $mentions := distinct-values($tweets/*[subject/user]/(subject/user/@id/data(.), string-join(for $i in subject/user/@id order by $i return $i, "+")))

(: basic trend data :)
let $first-tweet := $tweets/*[1]
let $last-tweet := $tweets/*[last()]
let $duration := xs:dateTime($last-tweet/stamp) - xs:dateTime($first-tweet/stamp)

(: calculation of facets :)
let $tweet-facet := (
	for $t in
			$tweets/*[not(self::retweet or self::duplicate)]
	let $subject := string-join($t/subject/node(), '')
	let $retweet-count :=
		count($tweets/*[self::retweet or self::duplicate][subject/@org = $subject])
	order by $retweet-count descending, $t/from/@id, $subject
	return
		<tweet retweets="{$retweet-count}">{$t/@*, $t/node()}</tweet>
)
let $time-facet := (
	let $first := xs:dateTime(concat(substring($first-tweet/stamp, 1, 11), '00:00:00'))
	let $last := xs:dateTime(concat(substring($last-tweet/stamp, 1, 11), '00:00:00')) + xs:dayTimeDuration("P1D")
	let $duration := $last - $first
	let $days := days-from-duration($duration)
	let $hours-per-segment := 24
	let $hours := round(hours-from-duration($duration) div $hours-per-segment)
	for $hour in (0 to ($days * 24 div $hours-per-segment + $hours))
	let $start := $first + xs:dayTimeDuration(concat("PT",$hour * $hours-per-segment, "H"))
	let $end := $first + xs:dayTimeDuration(concat("PT",($hour + 1) * $hours-per-segment, "H"))
	let $tweets :=
			$tweets/*[xs:dateTime(stamp) >= $start][$end > xs:dateTime(stamp)]
	let $count :=
		count($tweets)
	return
		<time count="{$count}">{$start}</time>
)
let $users-facet := (
	for $user in $users
	let $user-tweets := $tweets/*[not(self::retweet or self::duplicate)][from[@id = $user]]
	let $user-retweets := $tweets/*[self::retweet or self::duplicate][from[@id = $user]]
	let $tweet-count := count($user-tweets)
	let $retweet-count := count($user-retweets)
	let $count := $tweet-count + $retweet-count
	order by $tweet-count descending, $retweet-count descending, $user
	return
		<user id="{$user}" count="{$count}" tweets="{$tweet-count}" retweets="{$retweet-count}">@{$user}</user>
)
let $urls-facet := (
	for $url in $urls
	let $url-tweets := $tweets/*[not(self::retweet or self::duplicate)][subject/url[@full = $url]]
	let $url-retweets := $tweets/*[self::retweet or self::duplicate][subject/url[@full = $url]]
	let $tweet-sender-count := count(distinct-values($url-tweets/from))
	let $retweet-sender-count := count(distinct-values($url-retweets/from))
	let $sender-count := $tweet-sender-count + $retweet-sender-count
	let $tweet-count := count($url-tweets)
	let $retweet-count := count($url-retweets)
	let $count := $tweet-count + $retweet-count
	order by $sender-count descending, $tweet-count descending, $retweet-count descending, $url
	return
		<url full="{$url}" long="{$url}" org="{$url}" count="{$count}" tweets="{$tweet-count}" retweets="{$retweet-count}" senders="{$sender-count}" tweet-senders="{$tweet-sender-count}" retweet-senders="{$retweet-sender-count}">{$url}</url>
)
let $tags-facet := (
	for $tag in $tags
	let $tag-tweets := $tweets/*[not(self::retweet or self::duplicate)][string-join(for $i in subject/tag/@id[. != 'mluc11'] order by $i return $i, "+") = $tag]
	let $tag-retweets := $tweets/*[self::retweet or self::duplicate][string-join(for $i in subject/tag/@id[. != 'mluc11'] order by $i return $i, "+") = $tag]
	let $tweet-sender-count := count(distinct-values($tag-tweets/from))
	let $retweet-sender-count := count(distinct-values($tag-retweets/from))
	let $sender-count := $tweet-sender-count + $retweet-sender-count
	let $tweet-count := count($tag-tweets)
	let $retweet-count := count($tag-retweets)
	let $count := $tweet-count + $retweet-count
	order by $sender-count descending, $tweet-count descending, $retweet-count descending, $tag
	return
		<tag id="{$tag}" count="{$count}" tweets="{$tweet-count}" retweets="{$retweet-count}" senders="{$sender-count}" tweet-senders="{$tweet-sender-count}" retweet-senders="{$retweet-sender-count}">#{$tag}</tag>
)
let $mentions-facet := (
	for $mention in $mentions
	let $tweet-count := count($tweets/*[not(self::retweet or self::duplicate)][(subject/user/@id/data(.), string-join(for $i in subject/user/@id order by $i return $i, "+")) = $mention])
	let $retweet-count := count($tweets/*[self::retweet or self::duplicate][(subject/user/@id/data(.), string-join(for $i in subject/user/@id order by $i return $i, "+")) = $mention])
	let $count := $tweet-count + $retweet-count
	order by $count descending, $tweet-count descending, $mention
	return
		<user id="{$mention}" count="{$count}" tweets="{$tweet-count}" retweets="{$retweet-count}">@{$mention}</user>
)
let $contributors-facet := (
	let $tag-tweets := for $tag in $tags-facet[1 to 5]/@id return $tweets/*[subject/tag[@id = $tag]]
	let $url-tweets := for $url in $urls-facet[1 to 5]/@full return $tweets/*[subject/url[@full = $url]]
	let $tweets := <tweets>{$tag-tweets, $url-tweets}</tweets>
	for $user in distinct-values(($tag-tweets/from/@id, $url-tweets/from/@id))
	let $user-tweets := $tweets/*[not(self::retweet or self::duplicate)][from[@id = $user]]
	let $user-retweets := $tweets/*[self::retweet or self::duplicate][from[@id = $user]]
	let $tweet-count := count($user-tweets)
	let $retweet-count := count($user-retweets)
	let $count := $tweet-count + $retweet-count
	order by $tweet-count descending, $retweet-count descending, $user
	return
		<user id="{$user}" count="{$count}" tweets="{$tweet-count}" retweets="{$retweet-count}">@{$user}</user>
)

(: And presentation of analysis data in (a bit of dynamic) HTML :)
return
<html>
<head>
<style>
	body, ul, li {{ width: 100%; }}
	label {{ width: 200px; }}
	.separator {{ border-bottom: 1px solid black; width: 100%; height: 2px; }}
	.indent td {{ padding-left: 20px; }}
</style>
</head>
<body>
<h1>Trending topic: MLUC11</h1>

<h2>Statistieken</h2>
<ul>
<li><label>Start</label>:<span>{$first-tweet/stamp/text()}</span></li>
<li><label>By</label>:<span>{$first-tweet/from/text()}</span></li>
<li><label>End</label>:<span>{$last-tweet/stamp/text()}</span></li>
<li><label>By</label>:<span>{$last-tweet/from/text()}</span></li>
<li><label>Duration</label>:<span>{$duration}</span></li>
<li><label>Total tweets</label>:<span>{count($tweets/*)}</span></li>
<li><label>Nr tweets</label>:<span>{count($tweets/*[not(self::retweet or self::duplicate)])}</span></li>
<li><label>Nr retweets</label>:<span>{count($tweets/*[self::retweet or self::duplicate])}</span></li>
</ul>

<h2>Tweets</h2>
<p>Total: {count($tweet-facet)}</p>
<ol>{
	for $value in $tweet-facet
	where $value/@retweets > 0
	return
		<li>@{data($value/from/@id)}: {local:message-to-html($value/subject/node())} (retweets: {data($value/@retweets)})</li>
}</ol>

<h2>Time</h2>
<p>Total: {count($time-facet)}</p>
<ol>{
	for $value in $time-facet
	where $value/@count > 0
	return
		<li>{data($value)} (tweets: {data($value/@count)})</li>
}</ol>

<h2>Tweeters</h2>
<p>Total: {count($users-facet)}</p>
<ol>{
	for $value in $users-facet
	where $value/@count > 0
	return
		<li>{local:message-to-html($value)} (tweets: {data($value/@tweets)}, retweets: {data($value/@retweets)})</li>
}</ol>

<h2>Urls</h2>
<p>Total: {count($urls-facet)}</p>
<ol>{
	for $value in $urls-facet
	where $value/@count > 0
	return
		<li>{local:message-to-html($value)} (senders: {data($value/@senders)}, tweets: {data($value/@tweets)}, retweets: {data($value/@retweets)})</li>
}</ol>

<h2>Hashtags</h2>
<p>Total: {count($tags-facet)}</p>
<ol>{
	for $value in $tags-facet
	where $value/@count > 0
	return
		<li>{local:message-to-html($value)} (senders: {data($value/@senders)}, tweets: {data($value/@tweets)}, retweets: {data($value/@retweets)})</li>
}</ol>

<h2>Mentions</h2>
<p>Total: {count($mentions-facet)}</p>
<ol>{
	for $value in $mentions-facet
	where $value/@count > 0
	return
		<li>{local:message-to-html($value)} (tweets: {data($value/@tweets)}, retweets: {data($value/@retweets)})</li>
}</ol>

<h2>Top contributors</h2>
<p>Total: {count($contributors-facet)}</p>
<ol>{
	for $value in $contributors-facet
	where $value/@count > 0
	return
		<li>{local:message-to-html($value)} (tweets: {data($value/@tweets)}, retweets: {data($value/@retweets)})</li>
}</ol>

<h2>Tweets</h2>
<ul>
<li><a href="?mode=timeline#tweets">timeline</a></li>
<li><a href="?mode=timeline&amp;filter=tweet#tweets">tweet</a></li>
<li><a href="?mode=timeline&amp;filter=retweet#tweets">retweets</a></li>
<li><a href="?mode=threads#tweets">threads</a></li>
<li><a href="?mode=by-user#tweets">by user</a></li>
<li><a href="?mode=by-url#tweets">by url</a></li>
<li><a href="?mode=by-tag#tweets">by tag</a></li>
</ul>
<a name="tweets"><a/></a>
{

if ($mode eq 'timeline') then
	<table>
	<tr>
	<th>Type</th>
	<th>From</th>
	<th>Subject</th>
	<th>Stamp</th>
	</tr>
	{
		let $tweets :=
			if ($filter = 'tweet') then
				$tweets/*[not(self::retweet or self::duplicate)]
			else if ($filter = 'retweet') then
				$tweets/*[self::retweet or self::duplicate]
			else
				$tweets/*
		for $t in $tweets
		return
			<tr><td>{local-name($t)}</td><td>{$t/from/node()}</td><td>{local:message-to-html($t/subject/node())}</td><td>{$t/stamp/node()}</td></tr>
			(:
			<tr><td>{local-name($t)}</td><td>{$t/from/node()}</td><td>{data($t/subject/@org)}</td><td>{$t/stamp/node()}</td></tr>
			:)
	}
	</table>
else if ($mode eq 'threads') then
	<table>
	<tr>
	<th>Type</th>
	<th>From</th>
	<th>Subject</th>
	<th>Stamp</th>
	</tr>
	{
		for $t in
				$tweets/*[not(self::retweet or self::duplicate)]
		let $subject := string-join($t/subject/node(), '')
		return (
			<tr><td class="separator" colspan="5"><a/></td></tr>,
			<tr><td>{local-name($t)}</td><td>{$t/from/node()}</td><td>{local:message-to-html($t/subject/node())}</td><td>{$t/stamp/node()}</td></tr>,
			for $r at $pos in
				$tweets/*[self::retweet or self::duplicate][subject/@org = $subject]
			return
				<tr class="indent"><td>{local-name($r)}</td><td>{$r/from/node()}</td><td>{local:message-to-html($r/subject/node())}</td><td>{$r/stamp/node()}</td></tr>
		)
	}
	</table>
else if ($mode eq 'by-user') then
	<table>
	<tr>
	<th>User</th>
	<th>Type</th>
	<th>From</th>
	<th>Subject</th>
	<th>Stamp</th>
	</tr>
	{
			for $user in distinct-values(($users, $mentions))
			for $t at $pos in $tweets/*[from[@id = $user] or subject/user[@id = $user] or string-join(for $i in subject/user/@id order by $i return $i, "+") = $user]
			order by $user
			return (
				if ($pos eq 1) then
					<tr><td class="separator" colspan="5"><a/></td></tr>
				else (),
				<tr><td>{if ($pos eq 1) then $user else ()}</td><td>{local-name($t)}</td><td>{$t/from/node()}</td><td>{local:message-to-html($t/subject/node())}</td><td>{$t/stamp/node()}</td></tr>
			)
	}
	</table>
else if ($mode eq 'by-url') then
	<table>
	<tr>
	<th>Url</th>
	<th>Type</th>
	<th>From</th>
	<th>Subject</th>
	<th>Stamp</th>
	</tr>
	{
			for $url in $urls-facet
			for $t at $pos in $tweets/*[subject/url[@full = $url/@full]]
			return (
				if ($pos eq 1) then
					<tr><td class="separator" colspan="5"><a/></td></tr>
				else (),
				<tr><td>{if ($pos eq 1) then $url/@full/data(.) else ()}</td><td>{local-name($t)}</td><td>{$t/from/node()}</td><td>{local:message-to-html($t/subject/node())}</td><td>{$t/stamp/node()}</td></tr>
			)
	}
	</table>
else if ($mode eq 'by-tag') then
	<table>
	<tr>
	<th>Tag</th>
	<th>Type</th>
	<th>From</th>
	<th>Subject</th>
	<th>Stamp</th>
	</tr>
	{
			for $tag in $tags
			for $t at $pos in $tweets/*[subject/tag[@id = $tag] or string-join(for $i in subject/tag/@id[. != 'mluc11'] order by $i return $i, "+") = $tag]
			return (
				if ($pos eq 1) then
					<tr><td class="separator" colspan="5"><a/></td></tr>
				else (),
				<tr><td>{if ($pos eq 1) then $tag else ()}</td><td>{local-name($t)}</td><td>{$t/from/node()}</td><td>{local:message-to-html($t/subject/node())}</td><td>{$t/stamp/node()}</td></tr>
			)
	}
	</table>
else (
<p>Click one of the links above to get the tweet overview...</p>
)

}
<div style="display:none">{
$new-lookup
}</div>
</body>
</html>

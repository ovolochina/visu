package com.lyon2.controls.utils
{
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	[ResourceBundle("HumanDate")]
	
	public final class TimeUtils
	{
		private static const ressourceManager:IResourceManager = ResourceManager.getInstance();
		
		private static var time_table:Array = [
			new TimeUnit(3155760000, /* Siècle */
				ressourceManager.getString('HumanDate', 'short_century'),
				ressourceManager.getString('HumanDate', 'century')),
			new TimeUnit(31557600, /* Année */
				ressourceManager.getString('HumanDate', 'short_year'),
				ressourceManager.getString('HumanDate', 'year')),
			new TimeUnit(2592000, /* Mois */
				ressourceManager.getString('HumanDate', 'short_month'),
				ressourceManager.getString('HumanDate', 'month')),
			new TimeUnit(604800, /* Semaine */
				ressourceManager.getString('HumanDate', 'short_week'),
				ressourceManager.getString('HumanDate', 'week')),
			new TimeUnit(86400, /* Jour */
				ressourceManager.getString('HumanDate', 'short_day'),
				ressourceManager.getString('HumanDate', 'day')),
			new TimeUnit(3600, /* Heure */
				ressourceManager.getString('HumanDate', 'short_hour'),
				ressourceManager.getString('HumanDate', 'hour')),
			new TimeUnit(60, /* minute */
				ressourceManager.getString('HumanDate', 'short_minute'),
				ressourceManager.getString('HumanDate', 'minute')),
			new TimeUnit(1, /* seconde */
				ressourceManager.getString('HumanDate', 'short_second'),
				ressourceManager.getString('HumanDate', 'second'))
			]; 
		
		 public static function formatTimeString(numberOfSeconds:Number):String
         {
			if(isNaN(numberOfSeconds)){return '00:00'};
			if(numberOfSeconds) {
			var str:String='';
			var hours:int = numberOfSeconds/3600;
			if(hours>0) {
				str+=hours+':';
			}
			var min:int = (numberOfSeconds%3600)/60;
			if(min<10) 
				str+='0';
			str+=min+':';
			var sec:int = (numberOfSeconds%3600)%60;
			if(sec<10) 
				str+='0';
			str+=sec;
			return str;	
			} else
				return '00:00';
          }
          
		public static function relativeTime (to:Date, ref:Date=null, short:Boolean=false):String
		{
			ref ||= new Date();
			var diff_abs:Number = Math.abs(to.time - ref.time);
			var futur:Boolean = to.time > ref.time;
		 
			
			for each (var t:TimeUnit in time_table)
			{
				var rest:Number = int(diff_abs/(t.value*1000));
				var unit:String;
				var message:String;
				if (futur)
					message = ressourceManager.getString('HumanDate', 'futur');
				else
					message = ressourceManager.getString('HumanDate', 'past');
				if (rest >= 1)
				{
					if (rest == 1) unit = short? t.short_unit : t.long_unit.replace(/(\(([^\|)]*)\|?([^\|)]*)\))/,"$2");
					if (rest > 1) unit = short? t.short_unit : t.long_unit.replace(/(\(([^\|)]*)\|?([^\|)]*)\))/,"$3");
					return message.split("%d").join(rest+" "+unit).concat(".");
				}
			}
			return "";
		}
		
		
		public static function formatHHMM(date:Date):String {
			var s:String = "";
			s+=date.hours;
			s+=":" + asTwoDigitString(date.minutes);
			return s;
		}
		
		public static function formatHHMMSS(seconds:Number):String {
			var s:String = "";
			var hours:Number = int(seconds/3600);
			var rest:Number = int(seconds%3600);
			var minutes:Number = int(rest/60);
			var seconds:Number = int(rest%60);
			
			if(hours > 0) {
				s+=hours+":";
			}
			s+=asTwoDigitString(minutes)+":"+asTwoDigitString(seconds);
			return s;
		}
		
		private static function asTwoDigitString(n:Number):String {
			return (n<10?"0":"")+n;
		}
		
		public static function formatDDMMYYYY(date:Date):String {
			return asTwoDigitString(date.date) +"-"+asTwoDigitString(date.month +1)+"-"+date.fullYear;
		}
		
		public static function formatVisuDateTime(date:Date):String {
			var time:String = formatHHMM(date);
			var dateOnly:String = formatDDMMYYYY(date);
			return dateOnly + " " + time;
		}
		
		public static function compareDates (date1 : Object, date2 : Object) : int
		{
			if(date1==null && date2==null)
				return 0;
			if(date1==null)
				return 1;
			if(date2 == null)
				return -1;
				
		    var date1Timestamp : Number = (date1 as Date).getTime ();
		    var date2Timestamp : Number = (date2 as Date).getTime ();

		    var result : Number = -1;

		    if (date1Timestamp == date2Timestamp)
		    {
		        result = 0;
		    }
		    else if (date1Timestamp > date2Timestamp)
		    {
		        result = 1;
		    }

		    return result;
		} 
	}
}



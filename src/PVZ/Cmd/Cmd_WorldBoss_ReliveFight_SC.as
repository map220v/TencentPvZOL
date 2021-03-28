package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_WorldBoss_ReliveFight_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_WorldBoss_ReliveFight_SC";
      
      public static const REPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldBoss_ReliveFight_SC.report","report",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FightReport);
      
      public static const CURDAMAGE:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_WorldBoss_ReliveFight_SC.curDamage","curDamage",2 << 3 | WireType.VARINT);
      
      public static const ALLDAMAGE:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_WorldBoss_ReliveFight_SC.allDamage","allDamage",3 << 3 | WireType.VARINT);
       
      
      private var report$field:Dto_FightReport;
      
      private var curDamage$field:Int64;
      
      private var allDamage$field:Int64;
      
      public function Cmd_WorldBoss_ReliveFight_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_WorldBoss_ReliveFight_SC.$MessageID;
      }
      
      public function clearReport() : void
      {
         this.report$field = null;
      }
      
      public function get hasReport() : Boolean
      {
         return this.report$field != null;
      }
      
      public function set report(param1:Dto_FightReport) : void
      {
         this.report$field = param1;
      }
      
      public function get report() : Dto_FightReport
      {
         return this.report$field;
      }
      
      public function clearCurDamage() : void
      {
         this.curDamage$field = null;
      }
      
      public function get hasCurDamage() : Boolean
      {
         return this.curDamage$field != null;
      }
      
      public function set curDamage(param1:Int64) : void
      {
         this.curDamage$field = param1;
      }
      
      public function get curDamage() : Int64
      {
         return this.curDamage$field;
      }
      
      public function clearAllDamage() : void
      {
         this.allDamage$field = null;
      }
      
      public function get hasAllDamage() : Boolean
      {
         return this.allDamage$field != null;
      }
      
      public function set allDamage(param1:Int64) : void
      {
         this.allDamage$field = param1;
      }
      
      public function get allDamage() : Int64
      {
         return this.allDamage$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReport)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report$field);
         }
         if(this.hasCurDamage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.curDamage$field);
         }
         if(this.hasAllDamage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.allDamage$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldBoss_ReliveFight_SC.report cannot be set twice.");
                  }
                  _loc3_++;
                  this.report = new Dto_FightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.report);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldBoss_ReliveFight_SC.curDamage cannot be set twice.");
                  }
                  _loc4_++;
                  this.curDamage = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldBoss_ReliveFight_SC.allDamage cannot be set twice.");
                  }
                  _loc5_++;
                  this.allDamage = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

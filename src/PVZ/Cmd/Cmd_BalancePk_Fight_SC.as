package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_BalancePk_Fight_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_BalancePk_Fight_SC";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_BalancePk_Fight_SC.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const REPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_BalancePk_Fight_SC.report","report",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FightReport);
      
      public static const WIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_BalancePk_Fight_SC.win","win",3 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var report$field:Dto_FightReport;
      
      private var win$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_BalancePk_Fight_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_BalancePk_Fight_SC.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
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
      
      public function clearWin() : void
      {
         this.hasField$0 &= 4294967294;
         this.win$field = new Boolean();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set win(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.win$field = param1;
      }
      
      public function get win() : Boolean
      {
         return this.win$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasReport)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report$field);
         }
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.win$field);
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
                     throw new IOError("Bad data format: Cmd_BalancePk_Fight_SC.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_BalancePk_Fight_SC.report cannot be set twice.");
                  }
                  _loc4_++;
                  this.report = new Dto_FightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.report);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_BalancePk_Fight_SC.win cannot be set twice.");
                  }
                  _loc5_++;
                  this.win = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

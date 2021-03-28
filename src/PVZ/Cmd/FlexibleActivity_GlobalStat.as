package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_GlobalStat extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_GlobalStat";
      
      public static const TOP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_GlobalStat.top","top",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ShellingTop);
      
      public static const RANKTOP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_GlobalStat.rankTop","rankTop",2 << 3 | WireType.LENGTH_DELIMITED,Dto_RankTop);
      
      public static const PUMPKINNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_GlobalStat.pumpkinNum","pumpkinNum",3 << 3 | WireType.VARINT);
      
      public static const SECKILL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_GlobalStat.seckill","seckill",4 << 3 | WireType.LENGTH_DELIMITED,DtoGlobal_Seckill);
      
      public static const FLEXIBLEACTIVITY_26_RECORD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_GlobalStat.flexibleActivity_26_Record","flexibleActivity_26_Record",5 << 3 | WireType.LENGTH_DELIMITED,DtoGlobal_FlexibleActivity_26_Record);
      
      public static const FLEXIBLEACTIVITY_27_RECORD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_GlobalStat.flexibleActivity_27_Record","flexibleActivity_27_Record",6 << 3 | WireType.LENGTH_DELIMITED,DtoGlobal_FlexibleActivity_27_Record);
       
      
      public var top:Array;
      
      public var rankTop:Array;
      
      private var pumpkinNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var seckill$field:DtoGlobal_Seckill;
      
      public var flexibleActivity_26_Record:Array;
      
      public var flexibleActivity_27_Record:Array;
      
      public function FlexibleActivity_GlobalStat()
      {
         this.top = [];
         this.rankTop = [];
         this.flexibleActivity_26_Record = [];
         this.flexibleActivity_27_Record = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_GlobalStat.$MessageID;
      }
      
      public function clearPumpkinNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.pumpkinNum$field = new uint();
      }
      
      public function get hasPumpkinNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set pumpkinNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.pumpkinNum$field = param1;
      }
      
      public function get pumpkinNum() : uint
      {
         return this.pumpkinNum$field;
      }
      
      public function clearSeckill() : void
      {
         this.seckill$field = null;
      }
      
      public function get hasSeckill() : Boolean
      {
         return this.seckill$field != null;
      }
      
      public function set seckill(param1:DtoGlobal_Seckill) : void
      {
         this.seckill$field = param1;
      }
      
      public function get seckill() : DtoGlobal_Seckill
      {
         return this.seckill$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.top.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.top[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.rankTop.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rankTop[_loc3_]);
            _loc3_++;
         }
         if(this.hasPumpkinNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.pumpkinNum$field);
         }
         if(this.hasSeckill)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.seckill$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.flexibleActivity_26_Record.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.flexibleActivity_26_Record[_loc4_]);
            _loc4_++;
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.flexibleActivity_27_Record.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.flexibleActivity_27_Record[_loc5_]);
            _loc5_++;
         }
         for(_loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  this.top.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ShellingTop()));
                  break;
               case 2:
                  this.rankTop.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RankTop()));
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_GlobalStat.pumpkinNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.pumpkinNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_GlobalStat.seckill cannot be set twice.");
                  }
                  _loc4_++;
                  this.seckill = new DtoGlobal_Seckill();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.seckill);
                  break;
               case 5:
                  this.flexibleActivity_26_Record.push(ReadUtils.read$TYPE_MESSAGE(param1,new DtoGlobal_FlexibleActivity_26_Record()));
                  break;
               case 6:
                  this.flexibleActivity_27_Record.push(ReadUtils.read$TYPE_MESSAGE(param1,new DtoGlobal_FlexibleActivity_27_Record()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}

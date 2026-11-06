; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/0_alaw_to_s16_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@alaw_to_s16.table = internal global [256 x i32] zeroinitializer, align 16
@alaw_to_s16.ready = internal global i32 0, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %a_val.addr = alloca i8, align 1
  %i = alloca i32, align 4
  %v = alloca i32, align 4
  %t = alloca i32, align 4
  %seg = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i32, ptr @alaw_to_s16.ready, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end11, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %1, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4
  %xor = xor i32 %2, 85
  store i32 %xor, ptr %v, align 4
  %3 = load i32, ptr %v, align 4
  %and = and i32 %3, 127
  store i32 %and, ptr %t, align 4
  %4 = load i32, ptr %t, align 4
  %cmp1 = icmp slt i32 %4, 16
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %for.body
  %5 = load i32, ptr %t, align 4
  %shl = shl i32 %5, 4
  %add = add nsw i32 %shl, 8
  store i32 %add, ptr %t, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %6 = load i32, ptr %t, align 4
  %shr = ashr i32 %6, 4
  %and3 = and i32 %shr, 7
  store i32 %and3, ptr %seg, align 4
  %7 = load i32, ptr %t, align 4
  %and4 = and i32 %7, 15
  %shl5 = shl i32 %and4, 4
  %add6 = add nsw i32 %shl5, 264
  store i32 %add6, ptr %t, align 4
  %8 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %8, 1
  %9 = load i32, ptr %t, align 4
  %shl7 = shl i32 %9, %sub
  store i32 %shl7, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  %10 = load i32, ptr %v, align 4
  %and8 = and i32 %10, 128
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %11 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %12 = load i32, ptr %t, align 4
  %sub10 = sub nsw i32 0, %12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %11, %cond.true ], [ %sub10, %cond.false ]
  %13 = load i32, ptr %i, align 4
  %idxprom = sext i32 %13 to i64
  %arrayidx = getelementptr inbounds [256 x i32], ptr @alaw_to_s16.table, i64 0, i64 %idxprom
  store i32 %cond, ptr %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %14 = load i32, ptr %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 1, ptr @alaw_to_s16.ready, align 4
  br label %if.end11

if.end11:                                         ; preds = %for.end, %entry
  %15 = load i8, ptr %a_val.addr, align 1
  %idxprom12 = zext i8 %15 to i64
  %arrayidx13 = getelementptr inbounds [256 x i32], ptr @alaw_to_s16.table, i64 0, i64 %idxprom12
  %16 = load i32, ptr %arrayidx13, align 4
  ret i32 %16
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}

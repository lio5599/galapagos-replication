; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@alaw_to_s16.scale = internal constant [8 x i32] [i32 1, i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64], align 16

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
  %x = alloca i32, align 4
  %seg = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %shr = lshr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  %2 = load i32, ptr %x, align 4
  %and1 = and i32 %2, 15
  %mul = mul nsw i32 %and1, 16
  %3 = load i32, ptr %seg, align 4
  %tobool = icmp ne i32 %3, 0
  %4 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i32 264, i32 8
  %add = add nsw i32 %mul, %cond
  %5 = load i32, ptr %seg, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [8 x i32], ptr @alaw_to_s16.scale, i64 0, i64 %idxprom
  %6 = load i32, ptr %arrayidx, align 4
  %mul2 = mul nsw i32 %add, %6
  store i32 %mul2, ptr %t, align 4
  %7 = load i32, ptr %x, align 4
  %and3 = and i32 %7, 128
  %tobool4 = icmp ne i32 %and3, 0
  br i1 %tobool4, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %8 = load i32, ptr %t, align 4
  %sub = sub nsw i32 0, %8
  store i32 %sub, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load i32, ptr %t, align 4
  ret i32 %9
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

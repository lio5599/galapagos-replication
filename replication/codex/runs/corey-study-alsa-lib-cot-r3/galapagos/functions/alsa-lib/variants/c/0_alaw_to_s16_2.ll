; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
  %decoded = alloca i32, align 4
  %segment = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %scale = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %decoded, align 4
  %1 = load i32, ptr %decoded, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %segment, align 4
  %2 = load i32, ptr %decoded, align 4
  %and1 = and i32 %2, 15
  %mul = mul nsw i32 %and1, 2
  %add = add nsw i32 %mul, 1
  %mul2 = mul nsw i32 %add, 8
  store i32 %mul2, ptr %magnitude, align 4
  %3 = load i32, ptr %segment, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i32, ptr %segment, align 4
  %sub = sub nsw i32 %4, 1
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ 0, %cond.false ]
  %shl = shl i32 1, %cond
  store i32 %shl, ptr %scale, align 4
  %5 = load i32, ptr %magnitude, align 4
  %6 = load i32, ptr %segment, align 4
  %tobool3 = icmp ne i32 %6, 0
  %7 = zext i1 %tobool3 to i64
  %cond4 = select i1 %tobool3, i32 256, i32 0
  %add5 = add nsw i32 %5, %cond4
  %8 = load i32, ptr %scale, align 4
  %mul6 = mul nsw i32 %add5, %8
  store i32 %mul6, ptr %magnitude, align 4
  %9 = load i32, ptr %decoded, align 4
  %and7 = and i32 %9, 128
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %cond.end
  %10 = load i32, ptr %magnitude, align 4
  br label %cond.end12

cond.false10:                                     ; preds = %cond.end
  %11 = load i32, ptr %magnitude, align 4
  %sub11 = sub nsw i32 0, %11
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false10, %cond.true9
  %cond13 = phi i32 [ %10, %cond.true9 ], [ %sub11, %cond.false10 ]
  ret i32 %cond13
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

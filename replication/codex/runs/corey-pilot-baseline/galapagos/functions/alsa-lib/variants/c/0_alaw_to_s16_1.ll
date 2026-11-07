; ModuleID = '/home/cbh/galapagos-corey-runs/corey-pilot-baseline/functions/alsa-lib/variants/c/0_alaw_to_s16_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-pilot-baseline/functions/alsa-lib/variants/c/0_alaw_to_s16_1.c"
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
  %magnitude = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  %conv1 = trunc i32 %xor to i8
  store i8 %conv1, ptr %a_val.addr, align 1
  %1 = load i8, ptr %a_val.addr, align 1
  %conv2 = zext i8 %1 to i32
  %and = and i32 %conv2, 15
  %mul = mul nsw i32 %and, 16
  store i32 %mul, ptr %magnitude, align 4
  %2 = load i8, ptr %a_val.addr, align 1
  %conv3 = zext i8 %2 to i32
  %shr = ashr i32 %conv3, 4
  %and4 = and i32 %shr, 7
  switch i32 %and4, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb5
    i32 2, label %sw.bb7
    i32 3, label %sw.bb10
    i32 4, label %sw.bb13
    i32 5, label %sw.bb16
    i32 6, label %sw.bb19
  ]

sw.bb:                                            ; preds = %entry
  %3 = load i32, ptr %magnitude, align 4
  %add = add nsw i32 %3, 8
  store i32 %add, ptr %magnitude, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %4 = load i32, ptr %magnitude, align 4
  %add6 = add nsw i32 %4, 264
  store i32 %add6, ptr %magnitude, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %5 = load i32, ptr %magnitude, align 4
  %add8 = add nsw i32 %5, 264
  %mul9 = mul nsw i32 %add8, 2
  store i32 %mul9, ptr %magnitude, align 4
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %6 = load i32, ptr %magnitude, align 4
  %add11 = add nsw i32 %6, 264
  %mul12 = mul nsw i32 %add11, 4
  store i32 %mul12, ptr %magnitude, align 4
  br label %sw.epilog

sw.bb13:                                          ; preds = %entry
  %7 = load i32, ptr %magnitude, align 4
  %add14 = add nsw i32 %7, 264
  %mul15 = mul nsw i32 %add14, 8
  store i32 %mul15, ptr %magnitude, align 4
  br label %sw.epilog

sw.bb16:                                          ; preds = %entry
  %8 = load i32, ptr %magnitude, align 4
  %add17 = add nsw i32 %8, 264
  %mul18 = mul nsw i32 %add17, 16
  store i32 %mul18, ptr %magnitude, align 4
  br label %sw.epilog

sw.bb19:                                          ; preds = %entry
  %9 = load i32, ptr %magnitude, align 4
  %add20 = add nsw i32 %9, 264
  %mul21 = mul nsw i32 %add20, 32
  store i32 %mul21, ptr %magnitude, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %10 = load i32, ptr %magnitude, align 4
  %add22 = add nsw i32 %10, 264
  %mul23 = mul nsw i32 %add22, 64
  store i32 %mul23, ptr %magnitude, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb19, %sw.bb16, %sw.bb13, %sw.bb10, %sw.bb7, %sw.bb5, %sw.bb
  %11 = load i8, ptr %a_val.addr, align 1
  %conv24 = zext i8 %11 to i32
  %and25 = and i32 %conv24, 128
  %tobool = icmp ne i32 %and25, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.epilog
  %12 = load i32, ptr %magnitude, align 4
  br label %cond.end

cond.false:                                       ; preds = %sw.epilog
  %13 = load i32, ptr %magnitude, align 4
  %sub = sub nsw i32 0, %13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %12, %cond.true ], [ %sub, %cond.false ]
  ret i32 %cond
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

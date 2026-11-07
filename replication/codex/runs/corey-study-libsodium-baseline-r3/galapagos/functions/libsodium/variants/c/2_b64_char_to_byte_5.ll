; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %terms = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 65
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %3
  %or = or i32 %sub1, %sub2
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %sub, %not
  %arrayidx = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 0
  store i32 %and, ptr %arrayidx, align 16
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 %4, 71
  %5 = load i32, ptr %u, align 4
  %sub4 = sub i32 %5, 97
  %6 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %6
  %or6 = or i32 %sub4, %sub5
  %shr7 = lshr i32 %or6, 8
  %not8 = xor i32 %shr7, -1
  %and9 = and i32 %sub3, %not8
  %arrayidx10 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 1
  store i32 %and9, ptr %arrayidx10, align 4
  %7 = load i32, ptr %u, align 4
  %sub11 = sub i32 %7, -4
  %8 = load i32, ptr %u, align 4
  %sub12 = sub i32 %8, 48
  %9 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %9
  %or14 = or i32 %sub12, %sub13
  %shr15 = lshr i32 %or14, 8
  %not16 = xor i32 %shr15, -1
  %and17 = and i32 %sub11, %not16
  %arrayidx18 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 2
  store i32 %and17, ptr %arrayidx18, align 8
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub19 = sub i32 0, %xor
  %shr20 = lshr i32 %sub19, 8
  %not21 = xor i32 %shr20, -1
  %and22 = and i32 62, %not21
  %arrayidx23 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 3
  store i32 %and22, ptr %arrayidx23, align 4
  %11 = load i32, ptr %u, align 4
  %xor24 = xor i32 %11, 47
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %not27 = xor i32 %shr26, -1
  %and28 = and i32 63, %not27
  %arrayidx29 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 4
  store i32 %and28, ptr %arrayidx29, align 16
  %arrayidx30 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 0
  %12 = load i32, ptr %arrayidx30, align 16
  %arrayidx31 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 1
  %13 = load i32, ptr %arrayidx31, align 4
  %or32 = or i32 %12, %13
  %arrayidx33 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 2
  %14 = load i32, ptr %arrayidx33, align 8
  %arrayidx34 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 3
  %15 = load i32, ptr %arrayidx34, align 4
  %or35 = or i32 %14, %15
  %or36 = or i32 %or32, %or35
  %arrayidx37 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 4
  %16 = load i32, ptr %arrayidx37, align 16
  %or38 = or i32 %or36, %16
  %and39 = and i32 %or38, 255
  store i32 %and39, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  switch i32 %17, label %sw.default [
    i32 0, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry
  %18 = load i32, ptr %u, align 4
  %xor40 = xor i32 %18, 65
  %sub41 = sub i32 0, %xor40
  %shr42 = lshr i32 %sub41, 8
  %and43 = and i32 %shr42, 255
  store i32 %and43, ptr %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  %19 = load i32, ptr %x, align 4
  store i32 %19, ptr %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %20 = load i32, ptr %retval, align 4
  ret i32 %20
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

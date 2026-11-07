; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %rejected = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  store i32 255, ptr %rejected, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and = and i32 %3, %add
  %not = xor i32 %and, -1
  %5 = load i32, ptr %rejected, align 4
  %and5 = and i32 %5, %not
  store i32 %and5, ptr %rejected, align 4
  %6 = load i32, ptr %a, align 4
  %not6 = xor i32 %6, -1
  %7 = load i32, ptr %b, align 4
  %and7 = and i32 %not6, %7
  %8 = load i32, ptr %x.addr, align 4
  %add8 = add i32 %8, 71
  %and9 = and i32 %and7, %add8
  %not10 = xor i32 %and9, -1
  %9 = load i32, ptr %rejected, align 4
  %and11 = and i32 %9, %not10
  store i32 %and11, ptr %rejected, align 4
  %10 = load i32, ptr %b, align 4
  %not12 = xor i32 %10, -1
  %11 = load i32, ptr %c, align 4
  %and13 = and i32 %not12, %11
  %12 = load i32, ptr %x.addr, align 4
  %add14 = add i32 %12, -4
  %and15 = and i32 %and13, %add14
  %not16 = xor i32 %and15, -1
  %13 = load i32, ptr %rejected, align 4
  %and17 = and i32 %13, %not16
  store i32 %and17, ptr %rejected, align 4
  %14 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %14, 62
  %sub18 = sub i32 0, %xor
  %shr19 = lshr i32 %sub18, 8
  %not20 = xor i32 %shr19, -1
  %and21 = and i32 %not20, 45
  %not22 = xor i32 %and21, -1
  %15 = load i32, ptr %rejected, align 4
  %and23 = and i32 %15, %not22
  store i32 %and23, ptr %rejected, align 4
  %16 = load i32, ptr %x.addr, align 4
  %xor24 = xor i32 %16, 63
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %not27 = xor i32 %shr26, -1
  %and28 = and i32 %not27, 95
  %not29 = xor i32 %and28, -1
  %17 = load i32, ptr %rejected, align 4
  %and30 = and i32 %17, %not29
  store i32 %and30, ptr %rejected, align 4
  %18 = load i32, ptr %rejected, align 4
  %xor31 = xor i32 %18, 255
  ret i32 %xor31
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

; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_5.c"
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
  %result = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %0, 63
  %sub = sub i32 0, %xor
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %xor1 = xor i32 %and, 255
  store i32 %xor1, ptr %mask, align 4
  %1 = load i32, ptr %mask, align 4
  %and2 = and i32 %1, 95
  store i32 %and2, ptr %result, align 4
  %2 = load i32, ptr %x.addr, align 4
  %xor3 = xor i32 %2, 62
  %sub4 = sub i32 0, %xor3
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  %xor7 = xor i32 %and6, 255
  store i32 %xor7, ptr %mask, align 4
  %3 = load i32, ptr %mask, align 4
  %and8 = and i32 %3, 45
  %4 = load i32, ptr %result, align 4
  %or = or i32 %4, %and8
  store i32 %or, ptr %result, align 4
  %5 = load i32, ptr %x.addr, align 4
  %sub9 = sub i32 %5, 52
  %shr10 = lshr i32 %sub9, 8
  %and11 = and i32 %shr10, 255
  %xor12 = xor i32 %and11, 255
  %6 = load i32, ptr %x.addr, align 4
  %sub13 = sub i32 %6, 62
  %shr14 = lshr i32 %sub13, 8
  %and15 = and i32 %shr14, 255
  %and16 = and i32 %xor12, %and15
  store i32 %and16, ptr %mask, align 4
  %7 = load i32, ptr %mask, align 4
  %8 = load i32, ptr %x.addr, align 4
  %add = add i32 %8, -4
  %and17 = and i32 %7, %add
  %9 = load i32, ptr %result, align 4
  %or18 = or i32 %9, %and17
  store i32 %or18, ptr %result, align 4
  %10 = load i32, ptr %x.addr, align 4
  %sub19 = sub i32 %10, 26
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 255
  %xor22 = xor i32 %and21, 255
  %11 = load i32, ptr %x.addr, align 4
  %sub23 = sub i32 %11, 52
  %shr24 = lshr i32 %sub23, 8
  %and25 = and i32 %shr24, 255
  %and26 = and i32 %xor22, %and25
  store i32 %and26, ptr %mask, align 4
  %12 = load i32, ptr %mask, align 4
  %13 = load i32, ptr %x.addr, align 4
  %add27 = add i32 %13, 71
  %and28 = and i32 %12, %add27
  %14 = load i32, ptr %result, align 4
  %or29 = or i32 %14, %and28
  store i32 %or29, ptr %result, align 4
  %15 = load i32, ptr %x.addr, align 4
  %sub30 = sub i32 %15, 26
  %shr31 = lshr i32 %sub30, 8
  %and32 = and i32 %shr31, 255
  store i32 %and32, ptr %mask, align 4
  %16 = load i32, ptr %mask, align 4
  %17 = load i32, ptr %x.addr, align 4
  %add33 = add i32 %17, 65
  %and34 = and i32 %16, %add33
  %18 = load i32, ptr %result, align 4
  %or35 = or i32 %18, %and34
  store i32 %or35, ptr %result, align 4
  %19 = load i32, ptr %result, align 4
  ret i32 %19
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

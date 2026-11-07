; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
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
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %not = xor i32 %sub, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %not2 = xor i32 %sub1, -1
  %shr3 = lshr i32 %not2, 8
  %and4 = and i32 %shr3, 255
  %and5 = and i32 %and, %and4
  store i32 %and5, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub6 = sub i32 %3, 97
  %not7 = xor i32 %sub6, -1
  %shr8 = lshr i32 %not7, 8
  %and9 = and i32 %shr8, 255
  %4 = load i32, ptr %u, align 4
  %sub10 = sub i32 122, %4
  %not11 = xor i32 %sub10, -1
  %shr12 = lshr i32 %not11, 8
  %and13 = and i32 %shr12, 255
  %and14 = and i32 %and9, %and13
  store i32 %and14, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub15 = sub i32 %5, 48
  %not16 = xor i32 %sub15, -1
  %shr17 = lshr i32 %not16, 8
  %and18 = and i32 %shr17, 255
  %6 = load i32, ptr %u, align 4
  %sub19 = sub i32 57, %6
  %not20 = xor i32 %sub19, -1
  %shr21 = lshr i32 %not20, 8
  %and22 = and i32 %shr21, 255
  %and23 = and i32 %and18, %and22
  store i32 %and23, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub24 = sub i32 0, %xor
  %not25 = xor i32 %sub24, -1
  %shr26 = lshr i32 %not25, 8
  %and27 = and i32 %shr26, 255
  store i32 %and27, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor28 = xor i32 %8, 47
  %sub29 = sub i32 0, %xor28
  %not30 = xor i32 %sub29, -1
  %shr31 = lshr i32 %not30, 8
  %and32 = and i32 %shr31, 255
  store i32 %and32, ptr %q, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub33 = sub i32 %10, 65
  %and34 = and i32 %9, %sub33
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub35 = sub i32 %12, 97
  %add = add i32 %sub35, 26
  %and36 = and i32 %11, %add
  %or = or i32 %and34, %and36
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub37 = sub i32 %14, 48
  %add38 = add i32 %sub37, 52
  %and39 = and i32 %13, %add38
  %or40 = or i32 %or, %and39
  %15 = load i32, ptr %p, align 4
  %and41 = and i32 %15, 62
  %or42 = or i32 %or40, %and41
  %16 = load i32, ptr %q, align 4
  %and43 = and i32 %16, 63
  %or44 = or i32 %or42, %and43
  store i32 %or44, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub45 = sub i32 0, %18
  %not46 = xor i32 %sub45, -1
  %shr47 = lshr i32 %not46, 8
  %and48 = and i32 %shr47, 255
  %19 = load i32, ptr %u, align 4
  %xor49 = xor i32 %19, 65
  %sub50 = sub i32 0, %xor49
  %shr51 = lshr i32 %sub50, 8
  %and52 = and i32 %shr51, 255
  %and53 = and i32 %and48, %and52
  %or54 = or i32 %17, %and53
  ret i32 %or54
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

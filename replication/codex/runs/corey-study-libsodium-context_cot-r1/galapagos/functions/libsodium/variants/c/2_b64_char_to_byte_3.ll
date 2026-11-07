; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_3.c"
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
  %s = alloca i32, align 4
  %x = alloca i32, align 4
  %z = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %sub1 = sub i32 255, %and
  %2 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %2
  %shr3 = lshr i32 %sub2, 8
  %and4 = and i32 %shr3, 255
  %sub5 = sub i32 255, %and4
  %and6 = and i32 %sub1, %sub5
  store i32 %and6, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub7 = sub i32 %3, 97
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  %sub10 = sub i32 255, %and9
  %4 = load i32, ptr %u, align 4
  %sub11 = sub i32 122, %4
  %shr12 = lshr i32 %sub11, 8
  %and13 = and i32 %shr12, 255
  %sub14 = sub i32 255, %and13
  %and15 = and i32 %sub10, %sub14
  store i32 %and15, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub16 = sub i32 %5, 48
  %shr17 = lshr i32 %sub16, 8
  %and18 = and i32 %shr17, 255
  %sub19 = sub i32 255, %and18
  %6 = load i32, ptr %u, align 4
  %sub20 = sub i32 57, %6
  %shr21 = lshr i32 %sub20, 8
  %and22 = and i32 %shr21, 255
  %sub23 = sub i32 255, %and22
  %and24 = and i32 %sub19, %sub23
  store i32 %and24, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub25 = sub i32 0, %xor
  %shr26 = lshr i32 %sub25, 8
  %and27 = and i32 %shr26, 255
  %sub28 = sub i32 255, %and27
  store i32 %sub28, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor29 = xor i32 %8, 47
  %sub30 = sub i32 0, %xor29
  %shr31 = lshr i32 %sub30, 8
  %and32 = and i32 %shr31, 255
  %sub33 = sub i32 255, %and32
  store i32 %sub33, ptr %s, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub34 = sub i32 %10, 65
  %and35 = and i32 %9, %sub34
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub36 = sub i32 %12, 97
  %add = add i32 %sub36, 26
  %and37 = and i32 %11, %add
  %or = or i32 %and35, %and37
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub38 = sub i32 %14, 48
  %add39 = add i32 %sub38, 52
  %and40 = and i32 %13, %add39
  %or41 = or i32 %or, %and40
  %15 = load i32, ptr %p, align 4
  %and42 = and i32 %15, 62
  %or43 = or i32 %or41, %and42
  %16 = load i32, ptr %s, align 4
  %and44 = and i32 %16, 63
  %or45 = or i32 %or43, %and44
  store i32 %or45, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub46 = sub i32 0, %17
  %shr47 = lshr i32 %sub46, 8
  %and48 = and i32 %shr47, 255
  %sub49 = sub i32 255, %and48
  store i32 %sub49, ptr %z, align 4
  %18 = load i32, ptr %u, align 4
  %xor50 = xor i32 %18, 65
  %sub51 = sub i32 0, %xor50
  %shr52 = lshr i32 %sub51, 8
  %and53 = and i32 %shr52, 255
  store i32 %and53, ptr %n, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %z, align 4
  %21 = load i32, ptr %n, align 4
  %and54 = and i32 %20, %21
  %or55 = or i32 %19, %and54
  ret i32 %or55
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

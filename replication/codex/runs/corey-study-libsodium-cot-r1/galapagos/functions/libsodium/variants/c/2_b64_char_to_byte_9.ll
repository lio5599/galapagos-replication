; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %and2 = and i32 %shr, 255
  %xor = xor i32 255, %and2
  store i32 %xor, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 122, %4
  %or5 = or i32 %sub3, %sub4
  %shr6 = lshr i32 %or5, 8
  %and7 = and i32 %shr6, 255
  %xor8 = xor i32 255, %and7
  store i32 %xor8, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub9 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 57, %6
  %or11 = or i32 %sub9, %sub10
  %shr12 = lshr i32 %or11, 8
  %and13 = and i32 %shr12, 255
  %xor14 = xor i32 255, %and13
  store i32 %xor14, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor15 = xor i32 %7, 43
  %sub16 = sub i32 0, %xor15
  %shr17 = lshr i32 %sub16, 8
  %and18 = and i32 %shr17, 255
  %xor19 = xor i32 255, %and18
  store i32 %xor19, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor20 = xor i32 %8, 47
  %sub21 = sub i32 0, %xor20
  %shr22 = lshr i32 %sub21, 8
  %and23 = and i32 %shr22, 255
  %xor24 = xor i32 255, %and23
  store i32 %xor24, ptr %q, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub25 = sub i32 %10, 65
  %and26 = and i32 %9, %sub25
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub27 = sub i32 %12, 97
  %add = add i32 %sub27, 26
  %and28 = and i32 %11, %add
  %or29 = or i32 %and26, %and28
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub30 = sub i32 %14, 48
  %add31 = add i32 %sub30, 52
  %and32 = and i32 %13, %add31
  %or33 = or i32 %or29, %and32
  %15 = load i32, ptr %p, align 4
  %and34 = and i32 %15, 62
  %or35 = or i32 %or33, %and34
  %16 = load i32, ptr %q, align 4
  %and36 = and i32 %16, 63
  %or37 = or i32 %or35, %and36
  store i32 %or37, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %cmp = icmp ne i32 %17, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %18 = load i32, ptr %x, align 4
  store i32 %18, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %19 = load i32, ptr %u, align 4
  %xor38 = xor i32 %19, 65
  %sub39 = sub i32 0, %xor38
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  store i32 %and41, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
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
